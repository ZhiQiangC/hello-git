<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<body>
<div class="main-container-inner">
    <div>
        <!-- 页签路径标题 如：扣款管理 > 扣款查询 -->
        <div class="breadcrumbs" id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="icon-home home-icon"></i>
                    <a href="#"> 资金管理</a>
                </li>
                <li class="active">资金账户管理</li>
            </ul>
        </div>
        <div class="bg1">
            <div class="div_search_title">
                搜索
            </div>
            <table width="100%" border="0" cellpadding="5" cellspacing="1" style="border: 1px solid #EDEDED;">
                <tbody><tr>
                    <td bgcolor="EFF6FE">
                        <table width="98%" border="0" align="left" cellpadding="0" cellspacing="0">
                            <tbody><tr valign="top">
                                <td class="std_1" align="left">户名:</td>
                                <td class="std_2">
                                    <input type="text" name="accountName" style="width: 120px">
                                </td>
                                <td class="std_1" align="left">账户:</td>
                                <td class="std_2">
                                    <input type="text" name="bankCardNo" style="width: 120px">
                                </td>
                                <td class="std_1" align="left">开户行名称:</td>
                                <td class="std_2">
                                    <input type="text" name="bankName" style="width: 120px">
                                </td>

                                <td>
                                    <input type="submit" value="查询" class="btn btn-sm btn-prev">

                                </td>
                                <td>
                                    <a class="btn btn-sm btn-prev" data-last="Finish " href="#modal-wizard" data-toggle="modal" class="pink">
                                        新增
                                    </a>
                                </td>
                            </tr>
                            </tbody></table>
                    </td>
                </tr>
                </tbody></table>
        </div>

        <!-- 内容 -->
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">

                    <!-- 表格 -->
                    <table id="grid-table"></table>

                    <!-- 分页 -->
                    <div id="grid-pager"></div>

                </div>
            </div>
        </div>
    </div>
</div>


<!-- 引入JS脚本 start -->
<script src="${path}/assets/js/jquery-2.0.3.min.js"></script>
<script src="${path}/assets/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
    window.jQuery || document.write("<script src='${path}/assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
</script>
<script type="text/javascript">
    window.jQuery || document.write("<script src='${path}/assets/js/jquery-1.10.2.min.js'>" + "<" + "/script>");
</script>
<script type="text/javascript">
    if ("ontouchend" in document) document.write("<script src='${path}/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="${path}/assets/js/bootstrap.min.js"></script>
<script src="${path}/assets/js/typeahead-bs2.min.js"></script>
<script src="${path}/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${path}/assets/js/jqGrid/jquery.jqGrid.min.js"></script>
<script src="${path}/assets/js/jqGrid/i18n/grid.locale-en.js"></script>
<script src="${path}/assets/js/ace-elements.min.js"></script>
<script src="${path}/assets/js/ace.min.js"></script>
<!-- 引入JS脚本 end -->


<script type="text/javascript">


var indexcount = 0;
    var grid_data =
            [
                {id: "1", name: "Desktop Computer", note: "note", stock: "Yes", ship: "FedEx", sdate: "2007-12-03"},
                {id: "2", name: "Laptop", note: "Long text ", stock: "Yes", ship: "InTime", sdate: "2007-12-03"},
                {id: "3", name: "LCD Monitor", note: "note3", stock: "Yes", ship: "TNT", sdate: "2007-12-03"},
                {id: "4", name: "Speakers", note: "note", stock: "No", ship: "ARAMEX", sdate: "2007-12-03"},
                {id: "5", name: "Laser Printer", note: "note2", stock: "Yes", ship: "FedEx", sdate: "2007-12-03"},
                {id: "6", name: "Play Station", note: "note3", stock: "No", ship: "FedEx", sdate: "2007-12-03"},
                {id: "7", name: "Mobile Telephone", note: "note", stock: "Yes", ship: "ARAMEX", sdate: "2007-12-03"},
                {id: "8", name: "Server", note: "note2", stock: "Yes", ship: "TNT", sdate: "2007-12-03"},
                {id: "9", name: "Matrix Printer", note: "note3", stock: "No", ship: "FedEx", sdate: "2007-12-03"},
                {id: "10", name: "Desktop Computer", note: "note", stock: "Yes", ship: "FedEx", sdate: "2007-12-03"},
                {id: "11", name: "Laptop", note: "Long text ", stock: "Yes", ship: "InTime", sdate: "2007-12-03"},
                {id: "12", name: "LCD Monitor", note: "note3", stock: "Yes", ship: "TNT", sdate: "2007-12-03"},
                {id: "13", name: "Speakers", note: "note", stock: "No", ship: "ARAMEX", sdate: "2007-12-03"},
                {id: "14", name: "Laser Printer", note: "note2", stock: "Yes", ship: "FedEx", sdate: "2007-12-03"},
                {id: "15", name: "Play Station", note: "note3", stock: "No", ship: "FedEx", sdate: "2007-12-03"},
                {id: "16", name: "Mobile Telephone", note: "note", stock: "Yes", ship: "ARAMEX", sdate: "2007-12-03"},
                {id: "17", name: "Server", note: "note2", stock: "Yes", ship: "TNT", sdate: "2007-12-03"},
                {id: "18", name: "Matrix Printer", note: "note3", stock: "No", ship: "FedEx", sdate: "2007-12-03"},
                {id: "19", name: "Matrix Printer", note: "note3", stock: "No", ship: "FedEx", sdate: "2007-12-03"},
                {id: "20", name: "Desktop Computer", note: "note", stock: "Yes", ship: "FedEx", sdate: "2007-12-03"},
                {id: "21", name: "Laptop", note: "Long text ", stock: "Yes", ship: "InTime", sdate: "2007-12-03"},
                {id: "22", name: "LCD Monitor", note: "note3", stock: "Yes", ship: "TNT", sdate: "2007-12-03"},
                {id: "23", name: "Speakers", note: "note", stock: "No", ship: "ARAMEX", sdate: "2007-12-03"}
            ];

        function test(bankType,accountName,bankCardNo,bankName,isUsing){
 //          alert("bankType="+bankType);
//            alert("bankCardNo="+bankCardNo);
//            alert("accountName="+accountName);
//            alert("bankName="+bankName);
//            alert("isUsing="+isUsing);
                if(bankType == "undefined"){
                    $('#virtualAccount').attr("checked","checked");
                    $('#bankname').hide();$('#bankopenname').hide();
                    $('#virtualAccount').click();

                }else{
                    $('#bandAccount').attr("checked","checked");
                    $('#bankname').show();$('#bankopenname').show();
                    $('#bandAccount').click();

                }
            $('.bankType').val(bankType);
            $('.bankName').val(bankName);
            $('.bankCardNo').val(bankCardNo);
            $('.accountName').val(accountName);
        }


    jQuery(function ($) {
        var grid_selector = "#grid-table";
        var pager_selector = "#grid-pager";

        jQuery(grid_selector).jqGrid({

            data: ${datagrid}, // 表格数据，当 datatype 为"local" 时需填写
            datatype: "local", //数据来源，本地数据（local，json,jsonp,xml等）
            height: 350, // 表格高度，可为数值、百分比或'auto'
            autowidth:true,
            //mtype:"POST",//提交方式
            colNames: ['序号', '银行名称', '户名', '银行帐号', '开户行名称', '修改员工号', '创建时间', '修改时间', '启用状态', '操作'], // 表头
            colModel: [
                {name: 'id', index: 'id', sorttype: "int", editable: true, formatter: function (value, grid, rows, state){indexcount++;return indexcount; }
                },
                {name: 'bankType', index: 'bankType', editable: true, sorttype: "date",formatter: function(cellValue, options, rowObject) {
                    if(cellValue == 5){
                        return "农业银行";
                    }if(cellValue == 1){
                        return "招商银行";
                    }
                        return "";
                }  },
                {name: 'accountName', index: 'accountName', editable: true, editoptions: {size: "20", maxlength: "30"}},
                {
                    name: 'bankCardNo',
                    index: 'bankCardNo',
                    editable: true,
                    edittype: "checkbox",
                    editoptions: {value: "Yes:No"},
                },
                {
                    name: 'bankName',
                    index: 'bankName',
                    editable: true,
                    edittype: "select",
                    editoptions: {value: "FE:FedEx;IN:InTime;TN:TNT;AR:ARAMEX"}
                },
                {
                    name: 'updateUserId',
                    index: 'updateUserId',
//                    width: 150,
                    sortable: false,
                    editable: true,
                    edittype: "textarea",
                    editoptions: {rows: "2", cols: "10"}
                }
                ,
                {
                    name: 'createTime',
                    index: 'createTime',
//                    width: 150,
                    sortable: false,
                    editable: true,
                    edittype: "textarea",
                    editoptions: {rows: "2", cols: "10"}
                }
                ,
                {
                    name: 'updateTime',
                    index: 'updateTime',
//                    width: 150,
                    sortable: false,
                    editable: true,
                    edittype: "textarea",
                    editoptions: {rows: "2", cols: "10"}
                },
                {
                    name: 'isUsing',
                    index: 'isUsing',
//                    width: 150,
                    sortable: false,
                    editable: true,
                    edittype: "textarea",
                    editoptions: {rows: "2", cols: "10"}
                },
                {
                    name: 'bankType',
                    index: 'bankType',
//                    width: 150,
                    sortable: false,
                    editable: true,
                    edittype: "textarea",
                    editoptions: {rows: "2", cols: "10"},
                    formatter: function (value, grid, rows, state){
                            return "<a data-last='Finish ' href='#modal-wizard' data-toggle='modal' onclick= \" test('"+rows.bankType+"','"+rows.accountName+"','"+rows.bankCardNo+"','"+rows.bankName+"','"+rows.isUsing+"')\"> 修改 </a>";
                    }
                }


            ],
            gridComplete : function() {
                var ids = jQuery("#grid-table").jqGrid('getDataIDs');
                for ( var i = 0; i < ids.length; i++) {
                    var cl = ids[i];
                    be = "<input style='height:22px;width:20px;' type='button' value='E' onclick=\"jQuery('#grid-table').editRow('"
                            + cl + "');\" />";
                    se = "<input style='height:22px;width:20px;' type='button' value='S' onclick=\"jQuery('#grid-table').saveRow('"
                            + cl + "');\" />";
                    ce = "<input style='height:22px;width:20px;' type='button' value='C' onclick=\"jQuery('#grid-table').restoreRow('"
                            + cl + "');\" />";
                    jQuery("#grid-table").jqGrid('setRowData', ids[i],
                            {
                                act : be + se + ce
                            });
                }
            },
            viewrecords: true, // 是否在浏览导航栏显示记录总数
            rowNum: 10, //每页显示记录数
            rowList: [10, 20, 30, 50, 100], //用于改变显示行数的下拉列表框的元素数组。(即表格每页显示多少行)
            pager: pager_selector,  //分页、按钮所在的浏览导航栏
            altRows: true, //设置为交替行表格,默认为false
            //toppager: true, //是否在上面显示浏览导航栏

            multiselect: true, //是否多选
            //multikey: "ctrlKey", //是否只能用Ctrl按键多选
            multiboxonly: true, //是否只能点击复选框多选

            // 页码JS
            loadComplete: function () {
//                alert($('#grid-table').getGridParam('page'));  当前页码

                var table = this;
                setTimeout(function () {
                    updateActionIcons(table);
                    updatePagerIcons(table);
                    enableTooltips(table);
                }, 0);
            },

            caption: "查询结果",
            autowidth: true
        });

        function updateActionIcons(table) {
            var replacement =
            {
                'ui-icon-pencil': 'icon-pencil blue',
                'ui-icon-trash': 'icon-trash red',
                'ui-icon-disk': 'icon-ok green',
                'ui-icon-cancel': 'icon-remove red'
            };
            $(table).find('.ui-pg-div span.ui-icon').each(function () {
                var icon = $(this);
                var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
                if ($class in replacement) icon.attr('class', 'ui-icon ' + replacement[$class]);
            })
        }
        function updatePagerIcons(table) {
            var replacement =
            {
                'ui-icon-seek-first': 'icon-double-angle-left bigger-140',
                'ui-icon-seek-prev': 'icon-angle-left bigger-140',
                'ui-icon-seek-next': 'icon-angle-right bigger-140',
                'ui-icon-seek-end': 'icon-double-angle-right bigger-140'
            };
            $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function () {
                var icon = $(this);
                var $class = $.trim(icon.attr('class').replace('ui-icon', ''));

                if ($class in replacement) icon.attr('class', 'ui-icon ' + replacement[$class]);
            })
        }

        function enableTooltips(table) {
            $('.navtable .ui-pg-button').tooltip({container: 'body'});
            $(table).find('.ui-pg-div').tooltip({container: 'body'});
        }
    });
</script>
<div style="display:none">
    <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script>
</div>
</body>
<style type="text/css">
    .bg1 {
        padding-top: 20px;
        padding-right: 20px;
        padding-left: 20px;
        font-size: 13px;
        color: #000000;
    }
    .div_search_title{
        height: 37px;
        line-height: 37px;
        color: #fff;
        background: #307ecc;
        padding-left: 20px;

    }




</style>

<div id="modal-wizard" class="modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" data-target="#modal-step-contents" style="background-color: #eff3f8;">

                <div class="center">
                    <h4 class="title blue">资金账户新增</h4>
                </div>
            </div>

            <div class="modal-body step-content" id="modal-step-contents">
                <table style="width:300px;margin: auto;font-size: 15px" id="totalTable">
                    <tbody id="accountTypeChoose">
                    <tr>
                        <td>账户类型:&nbsp;&nbsp; &nbsp; &nbsp;     </td>
                        <td><input type="radio" name="accountType" value="1" id="bandAccount" checked="checked" onclick="if($('.bankName').val()=='undefined'){$('.bankName').val('')};$('#bankname').show();$('#bankopenname').show()">银行账户 </td>
                        <td><input type="radio" name="accountType" value="2" id="virtualAccount" onclick="$('#bankname').hide();$('#bankopenname').hide()">虚拟账户</td>
                    </tr>
                    </tbody>
                    <tbody class="showContent">
                    <tr id="bankname">
                        <td>行别:</td>
                        <td colspan="2">
                            <select style="width: 100%" name="bankType" class="bankType">
                                <option value="1">招商银行</option>
                                <option value="5">农业银行</option>
                            </select>
                        </td>
                        <td><font color="red">*</font></td>
                    </tr>
                    <tr id="bankopenname">
                        <td>开户行名称:</td>
                        <td colspan="2"><input type="text" style="width: 100%" name="bankName" class="bankName"></td>
                        <td><font color="red">*</font></td>
                    </tr>
                    <tr>
                        <td>账号:</td>
                        <td colspan="2"><input type="text" style="width: 100%" name="bankCardNo" class="bankCardNo"></td>
                        <td><font color="red">*</font></td>
                    </tr>
                    <tr>
                        <td>账户名称:</td>
                        <td colspan="2"><input type="text" style="width: 100%" name="accountName" class="accountName"></td>
                        <td><font color="red">*</font></td>
                    </tr>
                    <tr>
                        <td>备注:</td>
                        <td colspan="2"><input type="text" style="width: 100%" name="remark" class="remark"></td>
                    </tr>
                    <tr>
                        <td>是否可用:</td>
                        <td colspan="2">
                            <select style="width: 100%" name="isUsing" class="isUsing">
                                <option value="1">是</option>
                                <option value="0">否</option>
                            </select>
                        </td>
                        <td><font color="red">*</font></td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <div class="modal-footer wizard-actions">
                <button class="btn btn-sm btn-prev" data-dismiss="modal">
                    <i class="icon-arrow-left"></i>
                    关闭
                </button>

                <button class="btn btn-success btn-sm btn-next" data-last="Finish " onclick="alert($('.bankType').val());">
                    保存
                    <i class="icon-arrow-right icon-on-right"></i>
                </button>


            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
$('#modal-wizard .modal-header').ace_wizard();
$('#modal-wizard .wizard-actions .btn[data-dismiss=modal]').removeAttr('disabled');
</script>
</html>
