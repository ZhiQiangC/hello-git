<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<body>
<div>
    <!-- 页签路径标题 如：资金管理 > 存对公信息审核 -->
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <i class="icon-home home-icon"></i>
                <a href="#">资金管理</a>
            </li>
            <li class="active">存对公信息审核</li>
        </ul>
    </div>

    <!-- 动态查询条件 -->
    <div>
        <div class="col-xs-12">
            <form class="form-horizontal" role="form">
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right">金额</label>
                    <div class="col-sm-3">
                        <span class="input-icon">
                            <input type="text" id="1"/>
                            <i class="icon-leaf blue"></i>
                        </span>
                    </div>

                    <label class="col-sm-1 control-label no-padding-right">客户姓名</label>
                    <div class="col-sm-3">
                        <span class="input-icon">
                            <input type="text" id="2"/>
                            <i class="icon-leaf blue"></i>
                        </span>
                    </div>

                    <label class="col-sm-1 control-label no-padding-right">合同号</label>
                    <div class="col-sm-3">
                        <span class="input-icon">
                            <input type="text" id="3"/>
                            <i class="icon-leaf blue"></i>
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right">审核人</label>
                    <div class="col-sm-3">
                        <span class="input-icon">
                            <input type="text" id="4"/>
                            <i class="icon-leaf blue"></i>
                        </span>
                    </div>

                    <label class="col-sm-1 control-label no-padding-right">审核时间</label>
                    <div class="col-sm-3">
                        <span class="input-icon">
                            <input id="d12" type="text"/>
                            <img onclick="WdatePicker({el:'d12'})" src="${path}/assets/js/skin/datePicker.gif" width="16" height="22" align="absmiddle">
                        </span>
                    </div>

                    <label class="col-sm-1 control-label no-padding-right">状态</label>
                    <div class="col-sm-3">
                        <span class="input-icon">
                            <input type="text" id="6"/>
                            <i class="icon-leaf blue"></i>
                        </span>
                    </div>
                </div>

                <div class="col-md-offset-10 col-md-2">
                    <button class="btn btn-info btn-sm tooltip-info" type="button">
                        <i class="icon-ok"></i>
                        查询
                    </button><br>&nbsp;
                </div>

            </form>
        </div>
    </div>

    <!-- 内容 -->
    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">

                <!-- 表格 -->
                <table id="grid-table"></table>

                <!-- 分页 -->
                <div id="grid-pager"></div>

                <!-- 通过、导出按钮 -->
                <div>
                    <button class="btn btn-sm btn-success"><i class="icon-ok smaller-20">通过</i></button>
                    <button class="btn btn-sm btn-purple"><i class="icon-share smaller-20">导出</i></button>
                </div>

            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

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

    // 自定义按钮列
    actFormatter = function(cellvalue, options, rawObject) {
        var detail = '<div><button class="btn btn-minier btn-primary" style="float: left;"><i class="icon-ok smaller-20">详情</i></button></div>';

        var editBtn = '<div><button class="btn btn-minier btn-warning" style="float: left;"><i class="icon-undo smaller-20">回退</i></button></div>';

        var deleteBtn = '<div><button class="btn btn-minier btn-danger" style="float: left;"><i class="icon-wrench smaller-20">解除匹配</i></button></div>';
        return detail + editBtn + deleteBtn;
    };

    jQuery(function ($) {
        var grid_selector = "#grid-table";
        var pager_selector = "#grid-pager";

        jQuery(grid_selector).jqGrid({

            data: grid_data, // 表格数据，当 datatype 为"local" 时需填写
            datatype: "local", //数据来源，本地数据（local，json,jsonp,xml等）
            height: 350, // 表格高度，可为数值、百分比或'auto'
            //mtype:"POST",//提交方式
            colNames: ['序号', '到账日期', '分公司', '合同编号', '客户姓名', '金额', '对方账号', '对方户名', '摘要', '类型', '渠道', '手续费', '状态', '还款方式', '附件名称', '审核人', '审核时间', '操作'], // 表头
            colModel: [
                {name: 'id', index: 'id', sorttype: "int", editable: true},
                {name: 'sdate', index: 'sdate', editable: true, sorttype: "date"},
                {name: 'name', index: 'name', editable: true, editoptions: {size: "20", maxlength: "30"}},
                {
                    name: 'stock',
                    index: 'stock',
                    editable: true,
                    edittype: "checkbox",
                    editoptions: {value: "Yes:No"},
                },
                {
                    name: 'ship',
                    index: 'ship',
                    editable: true,
                    edittype: "select",
                    editoptions: {value: "FE:FedEx;IN:InTime;TN:TNT;AR:ARAMEX"}
                },
                {
                    name: 'note',
                    index: 'note',
//                    width: 150,
                    sortable: false,
                    editable: true,
                    edittype: "textarea",
                    editoptions: {rows: "2", cols: "10"}
                },
                {name: 'id', index: 'id', sorttype: "int", editable: true},
                {name: 'id', index: 'id', sorttype: "int", editable: true},
                {name: 'id', index: 'id', sorttype: "int", editable: true},
                {name: 'id', index: 'id', sorttype: "int", editable: true},
                {name: 'id', index: 'id', sorttype: "int", editable: true},
                {name: 'id', index: 'id', sorttype: "int", editable: true},
                {name: 'id', index: 'id', sorttype: "int", editable: true},
                {name: 'id', index: 'id', sorttype: "int", editable: true},
                {name: 'id', index: 'id', sorttype: "int", editable: true},
                {name: 'id', index: 'id', sorttype: "int", editable: true},
                {name: 'id', index: 'id', sorttype: "int", editable: true},
                <!--编辑（操作）列-->
                {name:'myac',index:'edit',width:200,fixed:true, sortable:false, resize:false,
                    formatter : actFormatter
                }
            ],

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

            caption: "存对公信息审核清单",
            autowidth: true
        });
    });
</script>
</body>
</html>
