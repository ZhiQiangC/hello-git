<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8" />
    <title>删除提示框</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
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

            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <form class="form-horizontal">
                            <div class="modal-header">
				                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				                 <h4 class="modal-title" id="delModalLabel">删除警告</h4>
			                </div>

                            <div class="space-6"></div>

                            <p id = "messagedel"  class="bigger-110 bolder center grey">您确定需要删除吗?
                            </p>

                            <div class="modal-footer" style="background-color: #ffffff">
                                <table style="width: 100%;text-align: center;">
                                    <tr>
                                        <td>
                                            <button id="delclose" type="button" class="btn btn-primary btn-round">关闭</button>
                                        </td>
                                        <td><button id="delsubmit" type="button" class="btn btn-primary btn-round">提交</button></td>
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
	/*用户删除*/
	$("#delsubmit").on("click", function () {
		 utils.ajaxPost(staticParam.action_reqPath_main, "removeUserInfoByIds", oReqData, 
         		function (o,msg){
			  $("#messagedel").text(msg);
		 });
	});
	 $("#delclose").on("click", function () {
	        $(this).attr("data-dismiss","modal");
	});
});
</script>
</body>
</html>
