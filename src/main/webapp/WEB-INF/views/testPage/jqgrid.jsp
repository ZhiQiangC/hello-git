<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>jqGrid - Ace Admin</title>

    <meta name="description" content="Dynamic tables and grids using jqGrid plugin" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <style type="text/css">
        #btnFun tr td button{
            margin-right: 40px;
        }
    </style>
</head>
<body>
<div>
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
            try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
        </script>

        <ul class="breadcrumb" id="getNavigation">
            <li>
                <i class="ace-icon fa fa-home home-icon"></i>
                <span href="#">Home</span>
            </li>
        </ul><!-- /.breadcrumb -->
    </div>

    <!-- /section:basics/content.breadcrumbs -->
    <div class="page-content">
        <!-- /section:settings.box -->
        <div class="page-content-area">
            <div class="page-header" style="border-bottom: #ffffff">
                <!-- #section:basics/content.searchbox -->
                <div class="nav-search" id="nav-search" style="left: 22px">
                    <table id="search_condition">
                        <tr>
                            <form class="form-search" id="search_form">
                                <td>
                                    <span>userName:</span>
                                    <span class="input-icon">
                                        <input type="text" placeholder="Search ..." class="nav-search-input" id="userName" name="userName" autocomplete="off" />
                                        <i class="ace-icon fa fa-search nav-search-icon"></i>
                                     </span>
                                </td>
                                <td>
                                    <span>orgNo:</span>
                                    <span class="input-icon">
                                        <input type="text" placeholder="Search ..." class="nav-search-input" id="orgNo" name="orgNo" autocomplete="off" />
                                        <i class="ace-icon fa fa-search nav-search-icon"></i>
                                    </span>
                                </td>
                                <td>
                                    <span>phone:</span>
                                    <span class="input-icon">
                                        <input type="text" placeholder="Search ..." class="nav-search-input" id="phone" name="phone" autocomplete="off" />
                                        <i class="ace-icon fa fa-search nav-search-icon"></i>
                                    </span>
                                </td>
                                <td>
                                    <span>invalidDate:</span>
                                    <span class="input-icon">
                                        <input type="text" placeholder="Search ..." class="nav-search-input" id="invalidDate" name="invalidDate" autocomplete="off" />
                                        <i class="ace-icon fa fa-search nav-search-icon"></i>
                                    </span>
                                </td>
                            </form>
                        </tr>
                    </table>
                </div>
            </div><!-- /.page-header -->
            <div class="page-header" style="margin-bottom: 30px;border-bottom: #ffffff">
                <div class="nav-search" style="left: 22px">
                    <table id="btnFun" style="width: 100%;text-align: center">
                        <tr>
                            <td>
                                <button class="btn btn-round btn-info" onclick="addMsg()">
                                    增加
                                    <i class="ace-icon fa fa-print  align-top bigger-125 icon-on-right"></i>
                                </button>
                                <button class="btn btn-round btn-info" onclick="delMsgAll()">
                                    删除
                                    <i class="ace-icon fa fa-print  align-top bigger-125 icon-on-right"></i>
                                </button>
                                <button class="btn btn-round btn-info">
                                    Info
                                    <i class="ace-icon fa fa-print  align-top bigger-125 icon-on-right"></i>
                                </button>
                                <button class="btn btn-round btn-info" id="search" onclick="fSearch()">
                                    搜索
                                    <i class="ace-icon fa fa-search align-top bigger-125 icon-on-right"></i>
                                </button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">

                    <table id="grid-table"></table>

                    <div id="grid-pager"></div>

                    <script type="text/javascript">
                        var $path_base = "..";
                    </script>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- 模态框 -->
<div class="modal fade" id="showModal" tabindex="-1" role="dialog"
     aria-labelledby="showModalLabel" aria-hidden="false">
    <div class="modal-dialog" style="width: 80%; height: auto">
        <div class="modal-content">

        </div>
    </div>
</div>
<!-- 模态框 (新增)-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
     aria-labelledby="addModalLabel" aria-hidden="false">
    <div class="modal-dialog" style="width: 80%; height: auto">
        <div class="modal-content">

        </div>
    </div>
</div>
<!-- 模态框（删除） -->
<div class="modal fade" id="delModal" tabindex="-1" role="dialog"
	aria-labelledby="delModalLabel" aria-hidden="false">
	<div class="modal-dialog" style="width: 30%;">
		<div class="modal-content">
			
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</div>
<!-- 模态框（显示提示信息） -->
<div class="modal fade" id="showMsg" tabindex="-1" role="dialog"
	aria-labelledby="delModalLabel" aria-hidden="false">
	<div class="modal-dialog" style="width: 30%;">
		<div class="modal-content">
			
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</div>
<!--[if !IE]> -->
<script type="text/javascript">
     window.jQuery || document.write("<script src='../../assets/js/jquery.min.js'>"+"<"+"/script>");
</script>

<!-- <![endif]-->

<!--[if IE]-->
<script type="text/javascript">
     window.jQuery || document.write("<script src='../../assets/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<!--[endif]-->
<script type="text/javascript">
     if('ontouchstart' in document.documentElement) document.write("<script src='../../assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<script type="text/javascript" src="../../assets/commonIframe.js"></script>
<script type="text/javascript">
    var raw;
    var msgShow;
    // 自定义按钮列
    actFormatter = function(cellvalue, options, rawObject) {
        var detail = '<div title="" class="ui-pg-div ui-inline-edit" id="detailButton" style="display: block; cursor: pointer; float: left;" onmouseover="jQuery(this).addClass(\'ui-state-hover\');" onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" onclick="showCustom('
            + options.rowId
            + ');" data-original-title="查看记录详情"><span class="ui-icon ace-icon fa fa-search-plus grey"></span></div>';

        var editBtn = '<div title="" class="ui-pg-div ui-inline-edit" id="editButton" style="display: block; cursor: pointer; float: left;" onmouseover="jQuery(this).addClass(\'ui-state-hover\');" onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" onclick="editCustom('
            + options.rowId
            + ');" data-original-title="编辑本条记录"><span class="ui-icon ui-icon-pencil"></span></div>';

        var deleteBtn = '<div title="" class="ui-pg-div ui-inline-edit" id="deleteButton" style="display: block; cursor: pointer; float: left;" onmouseover="jQuery(this).addClass(\'ui-state-hover\');" onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" onclick="deleteCustom('
            + options.rowId
            + ');" data-original-title="删除本条记录"><span class="ui-icon ace-icon fa fa-trash-o red"></span></div>';
       return detail + editBtn + deleteBtn;
    };
   /*增加模态框*/
   function addMsg(){
        $("#addModal").modal({
            remote: "add.jsp"//跳转到具体的模态框
        });
   }
   /*展示模态框*/
   function showCustom(id) {
        raw = jQuery("#grid-table").jqGrid('getRowData', id);//获取行数据
        $("#showModal").modal({
           remote: "show.jsp"
        });
   };
   /*编辑模态框*/
   function editCustom(id) {
        raw = jQuery("#grid-table").jqGrid('getRowData', id);
        $("#showModal").modal({
            remote: "edit.jsp"
        });
   };
   /*清除模态框数据，防止第二次访问相同的模态框会出现第一次使用过的数据*/
   $("#showModal").on("hidden.bs.modal", function() {
       $(this).removeData("bs.modal");
       $("#grid-table").jqGrid().trigger("reloadGrid");
   });
   $("#addModal").on("hidden.bs.modal", function() {
       $(this).removeData("bs.modal");
       $("#grid-table").jqGrid().trigger("reloadGrid");
   });

   //下拉框处理
   var items = {
       1 : 'Yes',
       2 : 'No'
   };
   var s = '';
   for (k in items)
       s += ';' + k + ":" + items[k];
   s = s.substring(1);
   //显示数据（传入模态框）
  $("#showModal").on("shown.bs.modal", function() {
       /*  $(this).find("#reset").click();
       $(this).find("#ID").val(raw.ID);
       $(this).find("#sdate").val(raw.sdate);
       $(this).find("#name").val(raw.name);
       for(var k in items){
          if(items[k] == raw.stock){
              $(this).find("#stock").val(k);
          }
       }
       $(this).find("#email").val(raw.email);
       $(this).find("#note").val(raw.note);
       $(this).find("#Tel").val(raw.Tel); */
	   $(this).find("#reset").click();
	   $(this).find("#userId").val(raw.userId);
	   $(this).find("#userName").val(raw.userName);
	   $(this).find("#addDate").val(raw.addDate);
	   $(this).find("#email").val(raw.email);
	   $(this).find("#enable").val(raw.enable);
	   $(this).find("#enableDate").val(raw.enableDate);
	   $(this).find("#invalidDate").val(raw.invalidDate);
	   $(this).find("#loginName").val(raw.loginName);
	   $(this).find("#orgName").val(raw.orgName);
	   $(this).find("#orgNo").val(raw.orgNo);
	   $(this).find("#passWord").val(raw.passWord);
	   $(this).find("#phone").val(raw.phone);
   });

   /*查询*/
   function fSearch(pageIndex,pageSize){
	   if(pageIndex == null || pageSize == null){
		   pageIndex = 1;
		   pageSize = $("#grid-table").getGridParam('rowNum');
	   }
	   var aSearchParam = getSearchCondition(); // 搜集查询条件
       var sJsonData = "";
       var sdata = {
    	   _sid: "getUserInfoList",
           json: sJsonData	
       }
       $("#grid-table").jqGrid("setGridParam", {
		   datatype : 'json',
		   postData : sdata,
		   page : pageIndex
	   }).trigger("reloadGrid");
   }
   /*查询条件的获取*/
   function getSearchCondition(){
	   var aSearchCondition = "";
       // 循环searchCondition，若内key值为“”则置为null
       for (var i in aSearchCondition) {
           if (aSearchCondition[i] == "") {
               aSearchCondition[i] = null;
           }
       }
       return aSearchCondition;
   }

   /* 删除单条数据 */
   function deleteCustom(id){
       var raw = jQuery("#grid-table").jqGrid('getRowData', id);
       var aUserIds = [];
       aUserIds.push(raw.userId);
       oReqData = {
            userIds: aUserIds.join(',')
       }
       /*删除模态框*/
       $('#delModal').modal({
            remote: "del.html"
       });
   }
   /* 删除多条数据 */
   function delMsgAll(){
	    var ids = $("#grid-table").jqGrid("getGridParam",'selarrrow');
	    if(ids.length > 0){
		    var aUserIds = [];
		    for(var i = 0; i < ids.length;i++){
			    var raw = jQuery("#grid-table").jqGrid('getRowData', ids[i]);
			    aUserIds.push(raw.userId);
		    }
		    oReqData = {
	            userIds: aUserIds.join(',')
	        }
		    $('#delModal').modal({
	            remote: "del.html"
	        });
	   }else{
		    msgShow = "请选择要删除的选项";
	        $('#showMsg').modal({
 	            remote: "../common/msgShow.html"
 	       });	
	   }
   }
   $("#delModal").on("hidden.bs.modal", function() {
       $(this).removeData("bs.modal");
       $("#grid-table").jqGrid().trigger("reloadGrid");
   });
   $("#showMsg").on("hidden.bs.modal", function() {
       $(this).removeData("bs.modal");
       $("#grid-table").jqGrid().trigger("reloadGrid");
   });
   jQuery(function($) {
       var grid_selector = "#grid-table";
       var pager_selector = "#grid-pager";
       //resize to fit page size
       $(window).on('resize.jqGrid', function () {//表格大小，自适应页面宽度
           $(grid_selector).jqGrid( 'setGridWidth', $(".page-content").width() );
       })
       //resize on sidebar collapse/expand
       var parent_column = $(grid_selector).closest('[class*="col-"]');
       $(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
           if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
              //setTimeout is for webkit only to give time for DOM changes and then redraw!!!
               setTimeout(function() {
                   $(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
               }, 0);
           }
       });
       var fullurl = "";
       var aSearchParam = getSearchCondition(); // 搜集查询条件
       var pageIndex = 1;
       var pageSize = 10;
       var sJsonData = "";
       var sdata = {
    	   _sid: "getUserInfoList",
           json: sJsonData	
       }
       //构建表格
       jQuery(grid_selector).jqGrid({
    	   url : fullurl,//请求的action
           mtype : "POST",
           postData : sdata,//请求的条件
           subGrid : false,//是否有子表
           datatype: "json",
           height: 250,//表格高度
           <!--定义列的字段名字-->
           colNames:['userId','userName','addDate','email','enable', 'enableDate', 'invalidDate','loginName','orgName','orgNo','passWord','phone','edit'],
           colModel:[//定义列的数据属性
               {name:'userId',index:'userId', width:60, editable: true},
               {name:'userName',index:'userName', width:70, editable: true},
               {name:'addDate',index:'addDate',width:90, editable:true, sorttype:"date"},
               {name:'email',index:'email', width:90, editable: true,edittype:"select",editoptions:{value:"FE:FedEx;IN:InTime;TN:TNT;AR:ARAMEX"}},
               {name:'enable',index:'enable', width:60, editable: true},
               {name:'enableDate',index:'enableDate',width:90, editable:true, sorttype:"date"},
               {name:'invalidDate',index:'invalidDate',width:90, editable:true, sorttype:"date"},
               {name:'loginName',index:'loginName', width:70, editable: true},
               {name:'orgName',index:'orgName', width:70, editable: true},
               {name:'orgNo',index:'orgNo', width:60, editable: true},
               {name:'passWord',index:'passWord', width:70, editable: true},
               {name:'phone',index:'phone', width:80, sortable:false,editable: true},
            <!--编辑（操作）列-->
               {name:'myac',index:'edit', width:80, fixed:true, sortable:false, resize:false,
                   formatter : actFormatter
               }
          ],
          jsonReader : {//自定义数据解析结构
    		  total: "totalPages",  
    		  records: "total"
    	  }, 
          viewrecords : true,//是否显示总记录数
          rowNum : pageSize,//初始化显示的条数
          rowList : [10,20,30],
          altRows : true,
          pager : pager_selector,//是否显示分页栏
          multiselect: true,//是否支持多选
          multiboxonly: true,
          shrinkToFit : true,//按比例初始化列宽度
          caption: "这是测试的数据",
          /*翻面改变事件*/
          onPaging : function(pgButton){
        	  if(pgButton == "first_grid-pager"){
        		  pageIndex = 1;
        	  }
        	  if(pgButton == "last_grid-pager"){
        		  pageIndex = $("#sp_1_grid-pager").text();
        	  }
        	  if(pgButton == "prev_grid-pager"){
        		  pageIndex--;
        	  }
              if(pgButton == "next_grid-pager"){
            	  pageIndex++;
              }
              if(pgButton == "user"){
            	  pageIndex = $("#grid-table").getGridParam('page');
              }  
              if(pgButton == "records"){
            	  pageSize = $(".ui-pg-selbox").val();
            	  pageIndex = 1;
              }
              fSearch(pageIndex,pageSize);
          },

          loadComplete : function() {
        	
              var table = this;
              setTimeout(function(){
                  updatePagerIcons(table);
                  enableTooltips(table);
              }, 0);
          }
       });
       $(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size

       //navButtons
       jQuery(grid_selector).jqGrid('navGrid',pager_selector,
            { 	//navbar options
                edit: false,
                add: false,
                del: false,
                search: false,
                refresh: false
            }
       ).navButtonAdd(pager_selector,{
                buttonicon:"ace-icon fa fa-refresh green",
                caption:"刷新",
                onClickButton: function(){
                    $(grid_selector).trigger("reloadGrid");
                },
                position:"last"
            });
      //replace icons with FontAwesome icons like above
      function updatePagerIcons(table) {
          var replacement =
          {
            'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
            'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
            'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
            'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
          };
          $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
             var icon = $(this);
             var $class = $.trim(icon.attr('class').replace('ui-icon', ''));

             if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
         })
    }

    function enableTooltips(table) {
        $('.navtable .ui-pg-button').tooltip({container:'body'});
        $(table).find('.ui-pg-div').tooltip({container:'body'});
    }

    $(document).on('ajaxloadstart', function(e) {
        $(grid_selector).jqGrid('GridUnload');
        $('.ui-jqdialog').remove();
    }); 
});

</script>
    
</body>
</html>
