
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
        // ������Excel�������ļ�
        // HSSFWorkbook wookbook= new HSSFWorkbook(new
        // FileInputStream(filePath));
        // ��Excel�ĵ��У���һ�Ź������ȱʡ������0��
        // �����Ϊ��HSSFSheet sheet = workbook.getSheetAt(0);
        // HSSFSheet sheet = wookbook.getSheet("Sheet1");
        // String filePath = "D://��������ģ��.xls";
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
                if (HSSFDateUtil.isCellDateFormatted(cell)) { // ������
                    Date date = HSSFDateUtil.getJavaDate(cellValue);
                    val = dateMat.format(date) + ",";
                    break;
                } else { // ��ֵ��
                    val = cimalMat.format(cellValue);
                    break;
                }
            case Cell.CELL_TYPE_STRING:
                val = cell.getStringCellValue().trim();
                if(val.length()==0){
                    val = "��";
                }
                break;
            default:
                val = "��";
                break;
        }
        return val;
    }




    public void addJsonToList(String value,List<JSONObject> list){
        String[] val = value.split(",");
        JSONObject json = new JSONObject();
        for (int j = 0; j < val.length; j++) {
            // ÿһ�������е�ֵ��������
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
            // ��ȡ��Excel�ļ��е���������
            int rows = sheet.getPhysicalNumberOfRows();
            Row r = sheet.getRow(0);
            int cells = r.getPhysicalNumberOfCells();

            // ������
            for (int i = 1; i < rows; i++) {
                // ��ȡ���϶˵�Ԫ��
                Row row = sheet.getRow(i);
                int b = i + 1;
                // �в�Ϊ��
                if (row != null) {
                    //��֤��Ϊ���ֶ�
                    Cell typeNoCell = row.getCell(0); // ���ͱ���
                    Cell typeCell = row.getCell(1); // ����
                    Cell channelNoCell = row.getCell(2); // ��������
                    Cell channelCell = row.getCell(3); // ����
                    Cell accountTimeCell = row.getCell(4); // ����ʱ��
                    Cell bankNoCell = row.getCell(8); // �����˺�

                    // ���ʹ�����֤
                    if ((typeNoCell == null) || (Cell.CELL_TYPE_BLANK == typeNoCell.getCellType())) {
                        JSONObject json = new JSONObject();
                        json.put("str", "�ļ�����ʧ�ܣ���" + b + "�����ʹ��벻��Ϊ��");
                        list.clear();
                        list.add(json);
                        return list;
                    }
                    // ������֤
                    if ((typeCell == null) || (Cell.CELL_TYPE_BLANK == typeCell.getCellType())) {
                        JSONObject json = new JSONObject();
                        json.put("str", "�ļ�����ʧ�ܣ���" + b + "�����Ͳ���Ϊ��");
                        list.clear();
                        list.add(json);
                        return list;
                    }

                    // ����������֤
                    if ((channelNoCell == null) || (Cell.CELL_TYPE_BLANK == channelNoCell.getCellType())) {
                        JSONObject json = new JSONObject();
                        json.put("str", "�ļ�����ʧ�ܣ���" + b + "���������벻��Ϊ��");
                        list.clear();
                        list.add(json);
                        return list;
                    }
                    // ������֤
                    if ((channelCell == null) || (Cell.CELL_TYPE_BLANK == channelCell.getCellType())) {
                        JSONObject json = new JSONObject();
                        json.put("str", "�ļ�����ʧ�ܣ���" + b + "����������Ϊ��");
                        list.clear();
                        list.add(json);
                        return list;
                    }
                    // ����ʱ����֤
                    if ((accountTimeCell == null) || (Cell.CELL_TYPE_BLANK == accountTimeCell.getCellType())) {
                        JSONObject json = new JSONObject();
                        json.put("str", "�ļ�����ʧ�ܣ���" + b + "�е���ʱ�䲻��Ϊ��");
                        list.clear();
                        list.add(json);
                        return list;
                    }

                    // �����˺���֤
                    if ((bankNoCell == null) || (Cell.CELL_TYPE_BLANK == bankNoCell.getCellType())) {
                        JSONObject json = new JSONObject();
                        json.put("str", "�ļ�����ʧ�ܣ���" + b + "�����˺Ų���Ϊ��");
                        list.clear();
                        list.add(json);
                        return list;
                    }

                    // ���ʹ�������Ͳ�Ϊ�յ�����£���֤�����Ƿ��Ӧ
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
                    boolean isType = false;// �ж������ݿ��Ƿ��и�typeNo;
                    for (FinanceTypeEntity typevo : typeList) {
                        if (typeNo.equals(typevo.getTypeNumber())) { // ������ͱ�������ݿ���
                            isType = true;// ���ݿ��и�typeNo
                            if (!type.equals(typevo.getTypeName())) { // ��Ȼ�У�ȴ���������Ʋ���Ӧ,return��
                                JSONObject json = new JSONObject();
                                json.put("str", "�ļ�����ʧ�ܣ���" + b + "�����ʹ�������Ͳ�ƥ��");
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
                    // ���û�и����ͱ��
                    if (!isType) {
                        JSONObject json = new JSONObject();
                        json.put("str", "�ļ�����ʧ�ܣ���" + b + "�����ʹ��벻����");
                        list.clear();
                        list.add(json);
                        return list;
                    }

                    // ���������������Ϊ�յ�����£���֤�����Ƿ��Ӧ

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
                    boolean isChannel = false;// �ж����ݿ��Ƿ��и�channelNo;
                    for (FinanceChannelEntity channelvo : channelList) {
                        if (channelNo.equals(channelvo.getChannelNumber())) { // ���������������ݿ���
                            isChannel = true;
                            if (!channel.equals(channelvo.getChannelName())) { // ��Ȼ�У�ȴ����������Ӧ
                                JSONObject json = new JSONObject();
                                json.put("str", "�ļ�����ʧ�ܣ���" + b + "�����������������ƥ��");
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

                    // ���û�и��������
                    if (!isChannel) {
                        JSONObject json = new JSONObject();
                        json.put("str", "�ļ�����ʧ�ܣ���" + b + "���������벻����");
                        list.clear();
                        list.add(json);
                        return list;
                    }

                    if ("C003".equals(channelNo)) {   //֧����ֻ�ܶ�Ӧ��Թ�
                        if (!"T001".equals(typeNo)) {
                            JSONObject json = new JSONObject();
                            json.put("str", "�ļ�����ʧ�ܣ���" + b + "������ֻ�ܶ�Ӧ��Թ�");
                            list.clear();
                            list.add(json);
                            return list;
                        }
                    }

                    // �����˺Ų�Ϊ�յ�����£���֤������ѡ��������
                    String bankNo = "";
                    switch (bankNoCell.getCellType()) {
                        case Cell.CELL_TYPE_NUMERIC:
                            bankNo = decimalFormat.format(bankNoCell.getNumericCellValue()).toString().trim();
                            break;
                        case Cell.CELL_TYPE_STRING:
                            bankNo = bankNoCell.getStringCellValue().trim();
                            break;
                    }
                    for (FinanceBankInfoEntity vo : voList) {    //voList����ѡ���������¶�Ӧ�����������˺�
                        bankNoList.add(vo.getBankCardNo());
                    }

                    if (!bankNoList.contains(bankNo)) {
                        JSONObject json = new JSONObject();
                        json.put("str", "�ļ�����ʧ�ܣ���" + b + "�������˺��ڸ������²�����");
                        list.clear();
                        list.add(json);
                        return list;
                    }
                    if (!"T007".equals(typeNo)) {// ������ͨ
                        bankNoList.clear();
                        // ��ȡ��Excel�ļ��е����е���
                        String value = "";

                        // ��֤ͨ������ֵд��value
                        for (int j = 0; j < cells; j++) {
                            int a = j + 1;
                            // ��ȡ���е�ֵ
                            Cell cell = row.getCell(j);
                            boolean isGetValue = false;  //�жϸõ�Ԫ���Ƿ���ȡֵ
                            if ((j == 5) || (j == 6) || (j == 7) || (j == 9)
                                    || (j == 10) || (j == 11) || (j == 12)
                                    || (j == 13) || (j == 14)) { // �����п���Ϊ��
                                if (cell == null || Cell.CELL_TYPE_BLANK == cell.getCellType()) {
                                    value += "��" + ",";
                                    isGetValue = true;
                                }
                            }

                            if(!isGetValue){  //��Ԫ��δȡֵ
                                // ��value��ֵ
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
                                    if (index < 0) {// ˵��ģ���е�������û�С�-��
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
                        // ��֤���ŷ�ģ��
                        Cell loanContractNoCell = row.getCell(13);
                        Cell loanNameCell = row.getCell(14);

                        if ((loanContractNoCell == null) || (Cell.CELL_TYPE_BLANK == loanContractNoCell.getCellType())) {
                            JSONObject json = new JSONObject();
                            json.put("str", "�ļ�����ʧ�ܣ���" + b + "�к�ͬ��Ų���Ϊ��");
                            list.clear();
                            list.add(json);
                            return list;
                        }

                        if ((loanNameCell == null) || (Cell.CELL_TYPE_BLANK == loanNameCell.getCellType())) {
                            JSONObject json = new JSONObject();
                            json.put("str", "�ļ�����ʧ�ܣ���" + b + "�пͻ���������Ϊ��");
                            list.clear();
                            list.add(json);
                            return list;
                        }

                        // ����ͨ����ֻ��Ϊ����
                        if (!"C005".equals(channelNo)) {
                            JSONObject json = new JSONObject();
                            json.put("str", "�ļ�����ʧ�ܣ���" + b + "����������");
                            list.clear();
                            list.add(json);
                            return list;
                        }

                        // ��֤���ȡֵ
                        String value = "";

                        for (int j = 0; j < cells; j++) {
                            int a = j + 1;
                            // ��ȡ���е�ֵ
                            boolean isGetValue = false;  //�жϸõ�Ԫ���Ƿ���ȡֵ
                            Cell cell = row.getCell(j);
                            if ((j == 5) || (j == 6) || (j == 7) || (j == 8) || (j == 9) || (j == 10) || (j == 11)
                                    || (j == 12)) { // �����п���Ϊ��
                                if (cell == null || Cell.CELL_TYPE_BLANK == cell.getCellType()) {
                                    value += "��" + ",";
                                    isGetValue = true;
                                }
                            }
                            if(!isGetValue){ //��Ԫ��δȡֵ
                                // ��value��ֵ
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
                                    if (index < 0) {// ˵��ģ���е�������û�С�-��
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

