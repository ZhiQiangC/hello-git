<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
</head>
<body>

<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="main-container-inner">
        <div class="main-content">
            <div class="page-content" style="padding-bottom: 0px">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->

                        <!-- 模态框（查询） -->

                        <form class="form-horizontal" id="validation-form">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">×</button>
                                <h4 class="modal-title" id="showModalLabel">显示数据</h4>
                            </div>
                            <div class="modal-body">
                                <table id="tabCSS" style="width: 100%">
                                    <tr>
                                        <td width="50%">
                                            <div class="row">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"
                                                           for="userId">userId</label>
                                                    <div class="col-sm-7">
                                                        <div class="clearfix">
                                                            <input type="text" id="userId" name="userId" placeholder="请输入……" class="form-control" readonly/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td width="50%">
                                            <div class="row">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"
                                                           for="userName">userName</label>
                                                    <div class="col-sm-7">
                                                        <div class="clearfix">
                                                            <input type="text" id="userName" name="userName" placeholder="请输入……" class="form-control" readonly/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="50%">
                                            <div class="row">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"
                                                           for="loginName">loginName</label>
                                                    <div class="col-sm-7">
                                                        <div class="clearfix">
                                                            <input type="text" id="loginName" name="loginName" placeholder="请输入……" class="form-control" readonly/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td width="50%">
                                            <div class="row">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"
                                                           for="passWord">passWord</label>
                                                    <div class="col-sm-7">
                                                        <div class="clearfix">
                                                            <input type="text" id="passWord" name="passWord" placeholder="请输入……" class="form-control" readonly/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                        <td width="50%">
                                            <div class="row">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"
                                                           for="orgName">orgName</label>
                                                    <div class="col-sm-7">
                                                        <div class="clearfix">
                                                            <input type="text" id="orgName" name="orgName" placeholder="请输入……" class="form-control" readonly/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td width="50%">
                                            <div class="row">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"
                                                           for="orgNo">orgNo</label>
                                                    <div class="col-sm-7">
                                                        <div class="clearfix">
                                                            <input type="text" id="orgNo" name="orgNo" placeholder="请输入……" class="form-control" readonly/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    <tr>
                                    </tr>
                                    <tr>
                                      <!--<td width="50%">
                                            <div class="row">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="stock">stock</label>
                                                    <div class="col-sm-7">
                                                        <div class="clearfix">
                                                            <select id="stock" name="stock" class="input-medium">
                                                                <option value="1">Yes</option>
                                                                <option value="2">No</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td> -->
                                        <td width="50%">
                                            <div class="row">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right no-padding-left"
                                                           for="email">email</label>
                                                    <div class="col-sm-7">
                                                        <div class="clearfix">
                                                            <input type="email" placeholder="请输入……" name="email"
                                                                   id="email" class="form-control" readonly/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td width="50%">
                                            <div class="row">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"
                                                           for="phone">phone</label>
                                                    <div class="col-sm-7 col-xs-12">
                                                        <div class="input-group">
                                                            <span class="input-group-addon">
                                                                <i class="ace-icon fa fa-phone"></i>
                                                            </span>
                                                            <input type="tel" placeholder="请输入……" name="phone" id="phone" class="form-control" readonly>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- <td>
                                            <div class="row">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"
                                                           for="IDCard">IDCard</label>
                                                    <div class="col-sm-7">
                                                        <div class="clearfix">
                                                            <input type="text" placeholder="请输入……" name="IDCard" id="IDCard" class="form-control" readonly>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="row">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"
                                                           for="nickName">nickName</label>
                                                    <div class="col-sm-7">
                                                        <div class="clearfix">
                                                            <input type="text" placeholder="请输入……" name="nickName" id="nickName" class="form-control" readonly>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td> -->
                                         <td width="50%">
                                            <div class="row">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"
                                                           for="enableDate">enableDate</label>
                                                    <div class="col-sm-7" style="position: relative; z-index: 9999;">
                                                        <div class="input-append date form-datetime input-group">
                                                            <span class="input-group-addon"><i class="ace-icon fa fa-calendar"></i></span>
                                                            <input type="text" id="enableDate" placeholder="请输入……" name="enableDate" class="form-control" readonly />
                                                            <span class="input-group-addon cancle"><i class="icon-remove fa fa-times"></i></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                         <td width="50%">
                                            <div class="row">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"
                                                           for="invalidDate">invalidDate</label>
                                                    <div class="col-sm-7" style="position: relative; z-index: 9999;">
                                                        <div class="input-append date form-datetime input-group">
                                                            <span class="input-group-addon"><i class="ace-icon fa fa-calendar"></i></span>
                                                            <input type="text" id="invalidDate" placeholder="请输入……" name="invalidDate" class="form-control" readonly />
                                                            <span class="input-group-addon cancle"><i class="icon-remove fa fa-times"></i></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="row">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"
                                                           for="enable">enable</label>
                                                    <div class="col-sm-7">
                                                        <div class="clearfix">
                                                            <input type="text" placeholder="请输入……" name="enable" id="enable" class="form-control" readonly>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <!-- <td colspan = "2">
                                            <div class="row">
                                                <div class="form-group">
                                                    <label style="width: 13.36%" class="col-sm-2 control-label no-padding-right" for="note">note</label>
                                                    <div class="col-sm-12" style="width: 77.68%">
                                                        <div class="clearfix">
                                                            <textarea class="col-xs-12" placeholder="请输入……" name="note" id="note" class="form-control" readonly></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td> -->
                                    </tr>
                                </table>
                            </div>
                            <div class="modal-footer" style="background-color: #ffffff">
                                <table style="width: 100%;text-align: center;">
                                    <tr>
                                        <td>
                                            <button id="close" type="button" class="btn btn-primary btn-round" data-dismiss="modal">关闭</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </form>
                        <!-- PAGE CONTENT ENDS -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.page-content -->
        </div>
        <!-- /.main-content -->

    </div>
    <!-- /.main-container-inner -->

</div>
<script src="../../assets/js/fuelux/fuelux.wizard.min.js"></script>
<script src="../../assets/js/jquery.validate.min.js"></script>
<script src="../../assets/js/additional-methods.min.js"></script>
<script src="../../assets/js/bootbox.min.js"></script>
<script src="../../assets/js/jquery.maskedinput.min.js"></script>
<script src="../../assets/js/select2.min.js"></script>
<!-- /.main-container -->
</body>
</html>