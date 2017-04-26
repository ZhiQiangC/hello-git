
package com.finance.util;

import com.alibaba.fastjson.JSONObject;
import com.finance.entity.FinanceBankInfoEntity;
import com.finance.entity.FinanceChannelEntity;
import com.finance.entity.FinanceTypeEntity;
import com.finance.service.FinanceOnlineBankingService;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;




public class ImportData {
    DecimalFormat decimalFormat = new DecimalFormat("0");

    DecimalFormat decimalFormatSecond = new DecimalFormat("0.00");

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    SimpleDateFormat dateFormatSecond = new SimpleDateFormat("yyyy-MM-dd");




    public Sheet getSheet(String filePath){
        // 创建对Excel工作簿文件
        // HSSFWorkbook wookbook= new HSSFWorkbook(new
        // FileInputStream(filePath));
        // 在Excel文档中，第一张工作表的缺省索引是0，
        // 其语句为：HSSFSheet sheet = workbook.getSheetAt(0);
        // HSSFSheet sheet = wookbook.getSheet("Sheet1");
        // String filePath = "D://网银导入模板.xls";
        Workbook book = null;
        try {
            book = new XSSFWorkbook(filePath);
        } catch (Exception ex) {
            try {
                book = new HSSFWorkbook(new FileInputStream(filePath));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        Sheet sheet = book.getSheetAt(0);
        return sheet;
    }




    public String getValueFromCell(Cell cell,DecimalFormat cimalMat,SimpleDateFormat dateMat){
        String val = "";
        switch (cell.getCellType()) {
            case Cell.CELL_TYPE_FORMULA:
                break;
            case Cell.CELL_TYPE_NUMERIC:
                double cellValue = cell.getNumericCellValue();
                if (HSSFDateUtil.isCellDateFormatted(cell)) { // 日期型
                    Date date = HSSFDateUtil.getJavaDate(cellValue);
                    val = dateMat.format(date) + ",";
                    break;
                } else { // 数值型
                    val = cimalMat.format(cellValue);
                    break;
                }
            case Cell.CELL_TYPE_STRING:
                val = cell.getStringCellValue().trim();
                if(val.length()==0){
                    val = "空";
                }
                break;
            default:
                val = "空";
                break;
        }
        return val;
    }




    public void addJsonToList(String value,List<JSONObject> list){
        String[] val = value.split(",");
        JSONObject json = new JSONObject();
        for (int j = 0; j < val.length; j++) {
            // 每一行列数中的值遍历出来
            json.put(String.valueOf(j), val[j]);
        }
        list.add(json);
    }


    public List<JSONObject> importDataTest(String filePath, List<FinanceBankInfoEntity> voList, List<FinanceTypeEntity> typeList,
                                           List<FinanceChannelEntity> channelList, FinanceOnlineBankingService bankingService){
        List<JSONObject> list = new ArrayList<JSONObject>();
        List<String> bankNoList = new ArrayList<String>();
        try {
            Sheet sheet = getSheet(filePath);
            // 获取到Excel文件中的所有行数
            int rows = sheet.getPhysicalNumberOfRows();
            Row r = sheet.getRow(0);
            int cells = r.getPhysicalNumberOfCells();

            // 遍历行
            for (int i = 1; i < rows; i++) {
                // 读取左上端单元格
                Row row = sheet.getRow(i);
                int b = i + 1;
                // 行不为空
                if (row != null) {
                    //验证不为空字段
                    Cell typeNoCell = row.getCell(0); // 类型编码
                    Cell typeCell = row.getCell(1); // 类型
                    Cell channelNoCell = row.getCell(2); // 渠道编码
                    Cell channelCell = row.getCell(3); // 渠道
                    Cell accountTimeCell = row.getCell(4); // 到账时间
                    Cell bankNoCell = row.getCell(8); // 银行账号

                    // 类型代码验证
                    if ((typeNoCell == null) || (Cell.CELL_TYPE_BLANK == typeNoCell.getCellType())) {
                        JSONObject json = new JSONObject();
                        json.put("str", "文件导入失败，第" + b + "行类型代码不能为空");
                        list.clear();
                        list.add(json);
                        return list;
                    }
                    // 类型验证
                    if ((typeCell == null) || (Cell.CELL_TYPE_BLANK == typeCell.getCellType())) {
                        JSONObject json = new JSONObject();
                        json.put("str", "文件导入失败，第" + b + "行类型不能为空");
                        list.clear();
                        list.add(json);
                        return list;
                    }

                    // 渠道代码验证
                    if ((channelNoCell == null) || (Cell.CELL_TYPE_BLANK == channelNoCell.getCellType())) {
                        JSONObject json = new JSONObject();
                        json.put("str", "文件导入失败，第" + b + "行渠道代码不能为空");
                        list.clear();
                        list.add(json);
                        return list;
                    }
                    // 渠道验证
                    if ((channelCell == null) || (Cell.CELL_TYPE_BLANK == channelCell.getCellType())) {
                        JSONObject json = new JSONObject();
                        json.put("str", "文件导入失败，第" + b + "行渠道不能为空");
                        list.clear();
                        list.add(json);
                        return list;
                    }
                    // 到账时间验证
                    if ((accountTimeCell == null) || (Cell.CELL_TYPE_BLANK == accountTimeCell.getCellType())) {
                        JSONObject json = new JSONObject();
                        json.put("str", "文件导入失败，第" + b + "行到账时间不能为空");
                        list.clear();
                        list.add(json);
                        return list;
                    }

                    // 银行账号验证
                    if ((bankNoCell == null) || (Cell.CELL_TYPE_BLANK == bankNoCell.getCellType())) {
                        JSONObject json = new JSONObject();
                        json.put("str", "文件导入失败，第" + b + "银行账号不能为空");
                        list.clear();
                        list.add(json);
                        return list;
                    }

                    // 类型代码和类型不为空的情况下，验证两者是否对应
                    String typeNo = "";
                    String type = "";
                    switch (typeNoCell.getCellType()) {
                        case Cell.CELL_TYPE_STRING:
                            typeNo = typeNoCell.getStringCellValue().trim();
                            break;
                    }
                    switch (typeCell.getCellType()) {
                        case Cell.CELL_TYPE_STRING:
                            type = typeCell.getStringCellValue().trim();
                            break;
                    }
                    boolean isType = false;// 判断是数据库是否有该typeNo;
                    for (FinanceTypeEntity typevo : typeList) {
                        if (typeNo.equals(typevo.getTypeNumber())) { // 表格类型编号在数据库有
                            isType = true;// 数据库有该typeNo
                            if (!type.equals(typevo.getTypeName())) { // 虽然有，却和类型名称不对应,return掉
                                JSONObject json = new JSONObject();
                                json.put("str", "文件导入失败，第" + b + "行类型代码和类型不匹配");
                                list.clear();
                                list.add(json);
                                return list;
                            } else {
                                break;
                            }
                        } else {
                            isType = false;
                        }
                    }
                    // 如果没有该类型编号
                    if (!isType) {
                        JSONObject json = new JSONObject();
                        json.put("str", "文件导入失败，第" + b + "行类型代码不存在");
                        list.clear();
                        list.add(json);
                        return list;
                    }

                    // 渠道代码和渠道不为空的情况下，验证两者是否对应

                    String channelNo = "";
                    String channel = "";
                    switch (channelNoCell.getCellType()) {
                        case Cell.CELL_TYPE_STRING:
                            channelNo = channelNoCell.getStringCellValue().trim();
                            break;
                    }
                    switch (channelCell.getCellType()) {
                        case Cell.CELL_TYPE_STRING:
                            channel = channelCell.getStringCellValue().trim();
                            break;
                    }
                    boolean isChannel = false;// 判断数据库是否有该channelNo;
                    for (FinanceChannelEntity channelvo : channelList) {
                        if (channelNo.equals(channelvo.getChannelNumber())) { // 表格渠道编号在数据库有
                            isChannel = true;
                            if (!channel.equals(channelvo.getChannelName())) { // 虽然有，却和渠道不对应
                                JSONObject json = new JSONObject();
                                json.put("str", "文件导入失败，第" + b + "行渠道代码和渠道不匹配");
                                list.clear();
                                list.add(json);
                                return list;
                            } else {
                                break;
                            }
                        } else {
                            isChannel = false;
                        }
                    }

                    // 如果没有该渠道编号
                    if (!isChannel) {
                        JSONObject json = new JSONObject();
                        json.put("str", "文件导入失败，第" + b + "行渠道代码不存在");
                        list.clear();
                        list.add(json);
                        return list;
                    }

                    if ("C003".equals(channelNo)) {   //支付宝只能对应存对公
                        if (!"T001".equals(typeNo)) {
                            JSONObject json = new JSONObject();
                            json.put("str", "文件导入失败，第" + b + "行渠道只能对应存对公");
                            list.clear();
                            list.add(json);
                            return list;
                        }
                    }

                    // 银行账号不为空的情况下，验证属于所选银行名称
                    String bankNo = "";
                    switch (bankNoCell.getCellType()) {
                        case Cell.CELL_TYPE_NUMERIC:
                            bankNo = decimalFormat.format(bankNoCell.getNumericCellValue()).toString().trim();
                            break;
                        case Cell.CELL_TYPE_STRING:
                            bankNo = bankNoCell.getStringCellValue().trim();
                            break;
                    }
                    for (FinanceBankInfoEntity vo : voList) {    //voList是所选银行名称下对应的所有银行账号
                        bankNoList.add(vo.getBankCardNo());
                    }

                    if (!bankNoList.contains(bankNo)) {
                        JSONObject json = new JSONObject();
                        json.put("str", "文件导入失败，第" + b + "行银行账号在该银行下不存在");
                        list.clear();
                        list.add(json);
                        return list;
                    }
                    if (!"T007".equals(typeNo)) {// 非增信通
                        bankNoList.clear();
                        // 获取到Excel文件中的所有的列
                        String value = "";

                        // 验证通过，将值写入value
                        for (int j = 0; j < cells; j++) {
                            int a = j + 1;
                            // 获取到列的值
                            Cell cell = row.getCell(j);
                            boolean isGetValue = false;  //判断该单元格是否已取值
                            if ((j == 5) || (j == 6) || (j == 7) || (j == 9)
                                    || (j == 10) || (j == 11) || (j == 12)
                                    || (j == 13) || (j == 14)) { // 此七列可以为空
                                if (cell == null || Cell.CELL_TYPE_BLANK == cell.getCellType()) {
                                    value += "空" + ",";
                                    isGetValue = true;
                                }
                            }

                            if(!isGetValue){  //单元格还未取值
                                // 给value赋值
                                SimpleDateFormat dateMat = dateFormat;
                                DecimalFormat cemalMat = null;
                                if ((j == 5) || (j == 6) || (j == 7)) {
                                    cemalMat = decimalFormatSecond;
                                }else{
                                    cemalMat = decimalFormat;
                                }
                                String val = getValueFromCell(cell,cemalMat,dateMat);
                                if(j == 4){
                                    int index = val.indexOf("-");
                                    if (index < 0) {// 说明模板中的年月日没有‘-’
                                        StringBuffer buffer = new StringBuffer(val);
                                        buffer.insert(4,"-");
                                        buffer.insert(7,"-");
                                        val = buffer.toString();
                                    }
                                }
                                value += val;
                            }
                        }
                        addJsonToList(value,list);
                    } else if ("T007".equals(typeNo)) {
                        // 验证增信费模板
                        Cell loanContractNoCell = row.getCell(13);
                        Cell loanNameCell = row.getCell(14);

                        if ((loanContractNoCell == null) || (Cell.CELL_TYPE_BLANK == loanContractNoCell.getCellType())) {
                            JSONObject json = new JSONObject();
                            json.put("str", "文件导入失败，第" + b + "行合同编号不能为空");
                            list.clear();
                            list.add(json);
                            return list;
                        }

                        if ((loanNameCell == null) || (Cell.CELL_TYPE_BLANK == loanNameCell.getCellType())) {
                            JSONObject json = new JSONObject();
                            json.put("str", "文件导入失败，第" + b + "行客户姓名不能为空");
                            list.clear();
                            list.add(json);
                            return list;
                        }

                        // 增信通渠道只能为其他
                        if (!"C005".equals(channelNo)) {
                            JSONObject json = new JSONObject();
                            json.put("str", "文件导入失败，第" + b + "行渠道错误");
                            list.clear();
                            list.add(json);
                            return list;
                        }

                        // 验证完后取值
                        String value = "";

                        for (int j = 0; j < cells; j++) {
                            int a = j + 1;
                            // 获取到列的值
                            boolean isGetValue = false;  //判断该单元格是否已取值
                            Cell cell = row.getCell(j);
                            if ((j == 5) || (j == 6) || (j == 7) || (j == 8) || (j == 9) || (j == 10) || (j == 11)
                                    || (j == 12)) { // 此七列可以为空
                                if (cell == null || Cell.CELL_TYPE_BLANK == cell.getCellType()) {
                                    value += "空" + ",";
                                    isGetValue = true;
                                }
                            }
                            if(!isGetValue){ //单元格还未取值
                                // 给value赋值
                                SimpleDateFormat dateMat = dateFormat;
                                DecimalFormat cemalMat = null;
                                if ((j == 5) || (j == 6) || (j == 7)) {
                                    cemalMat = decimalFormatSecond;
                                }else{
                                    cemalMat = decimalFormat;
                                }
                                String val = getValueFromCell(cell,cemalMat,dateMat);
                                if(j == 4){
                                    int index = val.indexOf("-");
                                    if (index < 0) {// 说明模板中的年月日没有‘-’
                                        StringBuffer buffer = new StringBuffer(val);
                                        buffer.insert(4,"-");
                                        buffer.insert(7,"-");
                                        val = buffer.toString();
                                    }
                                }
                                value += val;
                            }

                        }
                        addJsonToList(value,list);
                    }
                }
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}

