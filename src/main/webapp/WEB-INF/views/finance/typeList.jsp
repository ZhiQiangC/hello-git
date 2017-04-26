<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
                    <a href="#">资金管理</a>
                </li>
                <li class="active">类型信息</li>
            </ul>
        </div>

        <!-- 内容 -->
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">
                        <div class="row">
                            <div class="col-xs-11">
                                <div class="col-xs-4">
                                    <label class="col-sm-4 control-label text-right no-padding">类型编码:</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="typeNumber" name="typeNumber" value="${params.typeNumber}" class="col-xs-10 input-sm" placeholder="" >
                                    </div>
                                </div>
                                <div class="col-xs-4">
                                    <label class="col-sm-4 control-label text-right no-padding">类型名称:</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="typeName" name="typeName" value="${params.typeName}" class="col-xs-10 input-sm" placeholder="">
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-1">
                                <label>
                                    <button class="btn btn-sm  btn-primary btn-round" onclick="queryType('');">查询</button>
                                </label>
                            </div>
                        </div>
                    </div>

                    <!-- 表格 -->
                    <%--<table id="grid-table"></table>--%>
                    <table id="simple-table" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="col-xs-1 text-center" style="width: 3%;">序号</th>
                            <th class="col-xs-1 text-center">类型编码</th>
                            <th class="col-xs-1 text-center">类型名称</th>
                            <th class="col-xs-1 text-center">启用状态</th>
                            <th class="col-xs-1 text-center">操作</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="obj" items="${typeList}" varStatus="vs">
                            <tr>
                                <td class="text-center">${vs.index+1}</td>
                                <td class="text-center">${obj.typeNumber}</td>
                                <td class="text-center">${obj.typeName}</td>
                                <td class="text-center">
                                    <c:if test="${obj.isUsing eq '0'}">
                                        禁用<input type="hidden" name="isUsing" id="isUsing" value="${obj.isUsing}"/>
                                    </c:if>
                                    <c:if test="${obj.isUsing eq '1'}">
                                        启用<input type="hidden" name="isUsing" id="isUsing" value="${obj.isUsing}"/>
                                    </c:if>
                                </td>
                                <td class="text-center">
                                    <a href="javascript:void(0)" onclick="toDispose('${obj.id}');" title="">修改</a>
                                    <a href="javascript:void(0)" onclick="deletetype('${obj.id}');" title="">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <%--<zhph:tableEmpty colspan="5" resultList="${typeList}" />--%>
                        </tbody>
                    </table>
                    <div class='row'>
                        <div class='col-xs-12 text-right'>
                            <%--<a class='btn  btn-primary' onclick="toAdd();">新增</a>  pink    --%>
                            <a onclick="toAdd();" data-toggle="modal" class="btn  btn-primary">新增</a>
                        </div>
                    </div>
                    <!-- 分页 -->
                    <div id="grid-pager"></div>

                </div>
            </div>
        </div>
    </div>
</div>
<div id="modal-wizard" class="modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body step-content" id="modal-step-contents">
                <div class="step-pane active" id="modal-step1">
                    <div class="center">
                        <form action="" method="post" id="typeModelFormAdd" class="cmxform">
                            <input type="hidden" name="id" id="id" value=""/>
                            <table id="simple-table" class="table table-striped table-bordered table-hover text-center" style="border-color:white;">
                                <tr>
                                    <td>类型编码：</td>
                                    <td>
                                        <input type="text" name="typeNumber" id="typeNumber" value=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>类型名称：</td>
                                    <td>
                                        <input type="text" name="typeName" id="typeName" value=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>是否启用：</td>
                                    <td>
                                        <select class="text-center" name="isUsing" id="isUsing" style="width: 50%;">
                                            <option value='1'>启用</option>
                                            <option value='0'>禁用</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </form>


                    </div>
                </div>

            </div>

            <div class="modal-footer wizard-actions">

                <button class="save btn btn-success btn-sm btn-next " data-last="Finish"  onclick="saveType('')">
                    保存
                    <i class="icon-arrow-right icon-on-right"></i>
                </button>

                <button class="btn btn-danger btn-sm pull-left" data-dismiss="modal">
                    <i class="icon-remove"></i>
                    取消
                </button>
            </div>
        </div>
    </div>
</div><!-- PAGE CONTENT ENDS -->

<div id="modal-wizard—uodata" class="modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body step-content" id="modal-step-contents">
                <div class="step-pane active" id="modal-step1">
                    <div class="center">
                        <form action="" method="post" id="typeModelForm" class="cmxform">
                            <input type="hidden" name="ids" id="ids" value=""/>
                            <table id="simple-table" class="table table-striped table-bordered table-hover text-center" style="border-color:white;">
                                <tr>
                                    <td>类型编码：</td>
                                    <td>
                                        <span id="typeNumbers"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>类型名称：</td>
                                    <td>
                                        <input type="text" name="typeNames" id="typeNames" value=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>是否启用：</td>
                                    <td>
                                        <select class="text-center" name="isUsings" id="isUsings" style="width: 50%;">
                                            <option value='1'>启用</option>
                                            <option value='0'>禁用</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </form>


                    </div>
                </div>

            </div>

            <div class="modal-footer wizard-actions">

                <button class="save btn btn-success btn-sm btn-next " data-last="Finish"  onclick="updateUserStatus('')">
                    修改
                    <i class="icon-arrow-right icon-on-right"></i>
                </button>

                <button class="btn btn-danger btn-sm pull-left" data-dismiss="modal">
                    <i class="icon-remove"></i>
                    取消
                </button>
            </div>
        </div>
    </div>
</div><!-- PAGE CONTENT ENDS -->



<!--用户状态  模态框（Modal）结束-->
<SCRIPT type="text/javascript">


    function deletetype(id){
//		$.dialog({
//			message : "是否确认删除！",
//			title : "提醒",
//			cancelname : "取消",
//			okname : "确定",
//			ok : function() {
        $.ajax({
            type : "post",
            async : false,
            url : "${path}/deleteFinancingType.do",
            dataType : "json",
            data:{"id":id},
            success : function(data) {
                alert(data.msg);
                queryType();
            }
        });
//			}
//		});
    }
    function toAdd(){
        $("#modal-wizard").modal("show");
    }
    //保存
    function saveType(obj){
        var params = $("#typeModelFormAdd").serialize();
        $.ajax({
            async : false,
            type : "post",
            url : "${path}/saveFinancingType.do",
            data : params,
            success : function(data) {
                if(data.msg=='2'){
                    alert("类型编码已存在，清核对后再填！");
                }else if(data.msg=='3'){
                    alert("类型名称已存在，清核对后再填！");
                }else{
                    $("#modal-wizard").modal("hide");
                    alert(data.msg);
                    queryType();
                }
            }
        });
    }
    function queryType() {
        $.ajax({
            async : false,
            type : "post",
            url : "${path}/showTypeList.do",
//			dataType : "html",
            data : {
                "typeNumber" : $("#typeNumber").val(),
                "typeName" : $("#typeName").val()
            },
            success : function(data) {
                $("#content").html(data);
            }
        });
    }

    //修改状态Model展示
    function toDispose(id){
        loadUsers(id);
        $("#modal-wizard—uodata").modal("show");
    }
    //加载单个人员
    function loadUsers(id) {
        $.post("${path}/getFinancingType.do", {
            id : id
        }, function(data, status) {
            var record = JSON.parse(data);
            $("#typeNumbers").text(record.typeNumber);
            $("#typeNames").val(record.typeName);
            $("#isUsings").val(record.isUsing);
            $("#ids").val(id);
        });
    }

    //修改员工状态
    function updateUserStatus(obj){
        $.ajax({
            async : false,
            type : "post",
            url : "${path}/updateFinancingType.do",
            data:{
                "typeNumber" : $("#typeNumbers").val(),
                "typeName" : $("#typeNames").val(),
                "isUsing" : $("#isUsings").val(),
                "id" :$("#ids").val()
            },
            success : function(data) {
                if(data.msg=='3'){
                    alert("类型名称已存在，清核对后再填！");
                }else{
                    $("#modal-wizard—uodata").modal("hide");
                    alert(data.msg);
                    queryType();
                }
            }
        });
    }
    function reloadPage(){
        window.location.reload();
    }
</SCRIPT>

<div style="display:none">
    <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script>
</div>
</body>
</html>