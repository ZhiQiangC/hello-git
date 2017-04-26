<%--
  Created by IntelliJ IDEA.
  User: zhph
  Date: 2016-12-20
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="../head.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<ol class="breadcrumb">
    <li><a href="index.do">主页</a></li>
    <li><a href="javascript:;">用户管理</a></li>
    <li class="active">添加用户</li>
</ol>
<div class="container-fluid">

    <form class="form-group">
        <div class="form-group">
            <label for="roles">角色</label>
            <select class="form-control" id="roles">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
            </select>
        </div>
        <div class="form-group">
            <label for="userName">姓名</label>
            <input type="text" class="form-control" id="userName" placeholder="用户姓名" name="userName"/>
        </div>
        <div class="form-group">
            <label for="account">登陆名</label>
            <input type="text" class="form-control" id="account" placeholder="登陆账号" name="account"/>
        </div>
        <div class="form-group">
            <label for="loginPass">密码</label>
            <input type="password" class="form-control" id="loginPass" placeholder="登陆密码" name="loginPass"/>
        </div>
        <button type="submit" class="btn btn-default">保存</button>
    </form>
</div>

</body>
</html>
