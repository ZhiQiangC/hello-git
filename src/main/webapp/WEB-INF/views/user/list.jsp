<%--
  Created by IntelliJ IDEA.
  User: zhph
  Date: 2016-12-20
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ include file="../head.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<ol class="breadcrumb">
    <li><a href="index.do">主页</a></li>
    <li><a href="javascript:;">用户管理</a></li>
    <li class="active">用户列表</li>
</ol>
<div class="container-fluid">
    <form class="form-horizontal">
        <div class="form-group col-lg-4">
            <label class="col-sm-3 control-label" for="userName">用户姓名</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="userName" name="userName" placeholder="用户姓名">
            </div>
        </div>
        <div class="form-group col-lg-4">
            <label class="col-sm-3 control-label" for="account">账号</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="account" name="account" placeholder="账号">
            </div>
        </div>
        <div class="form-group col-lg-4 text-center">
            <button type="submit" class="btn btn-default">查询</button>
        </div>

    </form>
    <div class="panel-body">
        <shiro></shiro>
        <nav>
            <h3 class="pull-left">共有&nbsp;<span id="recordCount">500</span>&nbsp;条记录 当前&nbsp;<span id="curPage">1</span>/<span>
                    id="pageCount">200</span> 页</h3>
            <ul class="pagination pull-right">
                <li><a href="#">上一页</a></li>
                <li><a href="#">下一页</a></li>
            </ul>
        </nav>
        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
            <thead>
            <tr>
                <th>ID</th>
                <th>姓名</th>
                <th>账号</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>


            </tbody>
        </table>
    </div>
</div>


<script>
    $(function () {
        $(document).ready(function () {
            getUserList();

            $("form").submit(function() {
                getUserList();
                return false;
            });
        });

        function getUserList() {
            var formData = $("form").serialize();
            formData += "&curPage=" + $("#curPage").text();
            $.post("userList.do", formData, function (data) {
                $("#curPage").text(data.curPage);
                $("#recordCount").text(data.recordCount);
                $("#pageCount").text(data.pageCount);
                $("#dataTables-example tbody").html("");
                var trs = "";
                $.each(data.results, function (i, item) {
                    var td = "<td>" + item.id + "</td>";
                    td += "<td>" + item.userName + "</td>";
                    td += "<td>" + item.account + "</td>";
                    td += "<td></td>";
                    var tr = "<tr>" + td + "</tr>";
                    trs += tr;
                });
                $("#dataTables-example tbody").html(trs);
            });
        }


    });
</script>
</body>
</html>
