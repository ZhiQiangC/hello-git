<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>编辑提示框</title>
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

                        <form class="form-horizontal" id="validation-form-edit">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">×</button>
                                <h4 class="modal-title" id="showModalLabel">新增数据</h4>
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
                                                            <input type="text" id="userId" name="userId" placeholder="请输入……" class="form-control"/>
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
                                                            <input type="text" id="userName" name="userName" placeholder="请输入……" class="form-control"/>
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
                                                            <input type="text" id="loginName" name="loginName" placeholder="请输入……" class="form-control"/>
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
                                                            <input type="text" id="passWord" name="passWord" placeholder="请输入……" class="form-control"/>
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
                                                            <input type="text" id="orgName" name="orgName" placeholder="请输入……" class="form-control"/>
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
                                                            <input type="text" id="orgNo" name="orgNo" placeholder="请输入……" class="form-control"/>
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
                                                                   id="email" class="form-control"/>
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
                                                            <input type="tel" placeholder="请输入……" name="phone" id="phone" class="form-control">
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
                                                            <input type="text" placeholder="请输入……" name="IDCard" id="IDCard" class="form-control">
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
                                                            <input type="text" placeholder="请输入……" name="nickName" id="nickName" class="form-control">
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
                                                            <input type="text" placeholder="请输入……" name="enable" id="enable" class="form-control">
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
                                                            <textarea class="col-xs-12" placeholder="请输入……" name="note" id="note" class="form-control"></textarea>
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
                                            <button id="editclose" type="button" class="btn btn-primary btn-round">关闭</button>
                                        </td>
                                        <td><button id="reset" type="reset" class="btn btn-primary btn-round">重置</button></td>
                                        <td><button id="editsubmit" type="submit" class="btn btn-primary btn-round">提交</button></td>
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
<script type="text/javascript">
    jQuery(function($) {
    	   $(".form-datetime").datepicker({//添加日期选择功能
    	        language:"zh-CN",
    	        autoclose: true,
    	        todayBtn: "linked",
    	        format: "yyyymmdd"
    	    });
    	    $(".cancle").click(function(){
    	        $(this).parent().datepicker('hide');
    	        $(this).prev("input").val("");
    	    });
    	    $('[data-rel=tooltip]').tooltip();

    	    $(".select2").css('width','200px').select2({allowClear:true})
    	            .on('change', function(){
    	                $(this).closest('form').validate().element($(this));
    	   });


        var $validation = true;
        //documentation : http://docs.jquery.com/Plugins/Validation/validate


        $.mask.definitions['~']='[+-]';
        <!--自定义规则(电话号码验证)-->
        jQuery.validator.addMethod("phone", function (value, element) {
            return this.optional(element) || /(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$/.test(value);
        }, "phone number error.");
        <!--自定义规则(时间验证)-->
        jQuery.validator.addMethod("time", function(value, element){
            return this.optional(element) || /(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))0229)/.test(value);
        },"无效的时间.");
        <!--自定义规则(身份证验证)-->
        jQuery.validator.addMethod("isValid", function(value, element){
            return this.optional(element) || /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/.test(value);
        },"身份证输入错误.");
        jQuery.validator.addMethod("email",function(value, element){
            return this.optional(element) || /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/.test(value);
        });
        var validator = $('#validation-form-edit').validate({
            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: false,
            <!--定义规则   输入框ID ：｛规则内容｝-->
            rules: {
                userId:{
                    required: true,//必须输入的字段
                    digits:true,//必须输入整数(即数字)
                    rangelength:[5,10]//输入字符长度在5和10之间
                },
                IDCard:{
                    required: true,
                    isValid:"required"
                },
                email: {
                    required: true,//必须输入的字段
                    email:"required"
                },
                enableDate:{
                    required:true,
                    time:"required"
                },
                addDate:{
                    required:true,
                    time:"required"
                },
                invalidDate:{
                    required:true,
                    time:"required"
                },
                password: {
                    required: true,
                    rangelength:[5,10]//输入字符长度在5和10之间
                },
                password2: {
                    required: true,
                    rangelength:[5,10],
                    equalTo: "#password"
                },
                name: {
                    required: true
                },
                phone: {
                    digits:true,
                    required: true,
                    phone: 'required'
                },
                url: {
                    required: true,
                    url: true
                },
                comment: {
                    required: true
                },
                state: {
                    required: true
                },
                platform: {
                    required: true
                },
                subscription: {
                    required: true
                }
            },
            <!--错误信息提示,和上面的规则一一对应-->
            messages: {
                email: {
                    required: "email 不能为空.",
                    email: "email 输入错误."
                },
                sdate: {
                    required:"时间不能为空.",
                    date: "时间格式出错",
                    dateISO: "时间格式出错"
                },
                password: {
                    required: "Please specify a password.",
                    minlength: "Please specify a secure password."
                },
                state: "Please choose state",
                subscription: "Please choose at least one option",
                gender: "Please choose gender",
                agree: "Please accept our policy"
            },


            highlight: function (e) {
                $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
            },

            success: function (e) {
                $(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
                $(e).remove();
            },

            errorPlacement: function (error, element) {
                if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
                    var controls = element.closest('div[class*="col-"]');
                    if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
                    else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
                }
                else if(element.is('.select2')) {
                    error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
                }
                else if(element.is('.chosen-select')) {
                    error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
                }
                else error.insertAfter(element.parent());
            }
        });

        /*修改表单提交    必须要return false，否者会刷新整个界面*/
        $("#editsubmit").click(function(){
            if(validator.form() == true){
     	  	    var onCondition = extUtil.serializeObject($("#validation-form-edit"));
    	    	  alert(extUtil.json2Str(onCondition));
    	    	  utils.ajaxPost(staticParam.action_reqPath_main, "editUserInfo", onCondition, function (o,msg) {
    	        	  msgShow = msg;
    	        	  $('#showMsg').modal({
    	        	        remote: "../common/msgShow.html"
    	        	  });
     	        });
    	    	return false;
            }
        });


        $("#editclose").on("click", function () {
            $(this).attr("data-dismiss","modal");
        });
        $('#modal-wizard .modal-header').ace_wizard();
        $('#modal-wizard .wizard-actions .btn[data-dismiss=modal]').removeAttr('disabled');

        var $overflow = '';
        var colorbox_params = {
            rel : 'colorbox',
            reposition : true,
            scalePhotos : true,
            scrolling : true,
            previous : '<i class="ace-icon fa fa-arrow-left"></i>',
            next : '<i class="ace-icon fa fa-arrow-right"></i>',
            close : '&times;',
            current : '{current} of {total}',
            maxWidth : '100%',
            maxHeight : '100%',
            onOpen : function() {
                $overflow = document.body.style.overflow;
                document.body.style.overflow = 'hidden';
            },
            onComplete : function() {
                $.colorbox.resize();
            }
        };
        $("#cboxLoadingGraphic").html(
                "<i class='ace-icon fa fa-spinner orange'></i>");// let's add a custom loading icon
    })
</script>
</body>
</html>