<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>正合普惠結算平台</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <%@include file="../../common/commonCSS.jsp" %>
    <%@include file="../../common/commonJS.jsp" %>
    <script>
        function change(changeUrl) {
            $.ajax({
                type: "post",
                url: changeUrl,
                success: function (data) {
                    $("#content").html(data);
                }
            });
        }
    </script>
</head>

<body>
<div class="navbar navbar-default" id="navbar">
    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small>
                    <i class="icon-leaf"></i>
                    正合普惠 结算平台
                </small>
            </a><!-- /.brand -->
        </div><!-- /.navbar-header -->

        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="${path}/assets/images/user.jpg" alt="Jason's Photo"/>
								<span class="user-info">
									<small>Welcome,</small>
									Even
								</span>
                    </a>
                </li>
            </ul><!-- /.ace-nav -->
        </div><!-- /.navbar-header -->
    </div><!-- /.container -->
</div>


<div class="main-container">
    <div class="row">
        <div class="sidebar" id="sidebar">
            <div>
                <ul class="nav nav-list">
                    <li>
                        <a href="#" class="dropdown-toggle">
                            <i class="icon-desktop"></i>
                            <span class="menu-text"> 资金管理 </span>

                            <b class="arrow icon-angle-down"></b>
                        </a>

                        <ul class="submenu">
                            <li>
                                <a href="#" onclick="change('${path}/p2pSaveToPublicInfoCheck/init.do')">
                                    <i class="icon-double-angle-right"></i>
                                    存对公信息审核
                                </a>
                            </li>
                            <li>
                                <a href="#" onclick="change('${path}/bankinfoa.do')">
                                    <i class="icon-double-angle-right"></i>
                                    资金账户管理
                                </a>
                            </li>
                            <li>
                                <a href="#" onclick="change('${path}/checkFail.do')">
                                    <i class="icon-double-angle-right"></i>
                                    对账失败查询
                                </a>
                            </li>
                        </ul>

                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle">
                            <i class="icon-desktop"></i>
                            <span class="menu-text"> 表格 </span>

                            <b class="arrow icon-angle-down"></b>
                        </a>

                        <ul class="submenu">
                            <li>
                                <a href="#" onclick="change('${path}/testTable.do')">
                                    <i class="icon-double-angle-right"></i>
                                    table
                                </a>
                            </li>

                            <li>
                                <a href="#" onclick="change('${path}/testTable.do')">
                                    <i class="icon-double-angle-right"></i>
                                    table
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#" class="dropdown-toggle">
                            <i class="icon-desktop"></i>
                            <span class="menu-text"> 表单 </span>

                            <b class="arrow icon-angle-down"></b>
                        </a>

                        <ul class="submenu">
                            <li>
                                <a href="#" onclick="change('${path}/testForm.do')">
                                    <i class="icon-double-angle-right"></i>
                                    form
                                </a>
                            </li>

                            <li>
                                <a href="#" onclick="change('${path}/testForm.do')">
                                    <i class="icon-double-angle-right"></i>
                                    form
                                </a>
                            </li>
                        </ul>
                    </li>

                </ul><!-- /.nav-list -->
            </div>

            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
                   data-icon2="icon-double-angle-right"></i>
            </div>

            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'collapsed')
                } catch (e) {
                }
            </script>
        </div>

        <div class="main-content">
            <div id="content">
                <img src="${path}/assets/images/index_welcome.png">
            </div>
        </div><!-- /.main-content -->
    </div><!-- /.main-container -->
</div>
</div>
</body>
</html>

