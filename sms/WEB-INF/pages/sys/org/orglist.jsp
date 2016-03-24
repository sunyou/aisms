<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
    <title>系统管理——医保机构管理</title>
    <link href="${ctx}/sms/statics/common/css/css.css" rel="stylesheet" type="text/css"/> 
    <link type="text/css" rel="stylesheet" href="${ctx}/sms/statics/common/js/jquery-easyui/themes/default/easyui.css"/>
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/jquery.easyui.min.js"></script>
    
    <link type="text/css" rel="stylesheet" href="${ctx}/sms/statics/common/js/date/skin/WdatePicker.css"/>
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/date/WdatePicker.js"></script> 
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/jquery.jqGrid.min.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/grid.locale-cn.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/sys/orglist.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
      .ui-jqgrid-btable .ui-widget-content.ui-state-highlight {
       background-color: #c4efc9
      }
    </style>
        
</head>
<body>
<div class="wrap100 quickrecharge"> 
	
	<div class="q_r_list">
	
	<!--查询条件 begin-->
        <div class="listTable">
            <form id="searchForm" action="#">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <th class="r" width="8%">所在地区：</th>
                        <td width="30%" colspan="2">
                            <select  id="provinceCode" name="provinceCode" class="selectinput" onchange="getCityList(this)">
                            	 <option value="-1">请选择</option>
                            </select>&nbsp;
                            <select  id="cityCode" name="cityCode" class="selectinput" onchange="getCountyList(this)">
                            	<option value="-1">请选择</option>
                            </select>&nbsp;
                            <select  id="countyCode" name="countyCode" class="selectinput" >
                            	<option value="-1">请选择</option>
                            </select>
                        </td>
                        <th class="r" width="8%">机构编码 ：</th>
                        <td width="15%" colspan="2">
                            <input id="orgId" name="orgId" class="inputW120" />
                        </td>     
                        <th class="r" width="8%">机构名称 ：</th>
                        <td width="15%" colspan="2">
                            <input id="orgName" name="orgName" class="inputW120" />
                        </td>      
                    </tr>
                    <tr>
                    	<th class="r" width="8%">状态 ：</th>
                        <td width="30%" colspan="2">
                            <input type="radio" id="status" name="status" value="0" checked="checked" />启用&nbsp;
                            <input type="radio" id="status" name="status" value="1" />停用
                        </td> 
                        <th></th>
                        <td>
  					   		<a href="javascript:void(0)" onclick="reloadGrid()" class="fm-button ui-state-default ui-corner-all fm-button-icon-right ui-reset btn btn-sm btn-success"><span class="icon-search"></span>查询</a> 
                       		<a href="javascript:void(0)" onclick="com.ai.bdx.util.reset('searchForm');" class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-search btn btn-sm btn-gray"><span class="icon-retweet"></span>重 置</a>
  					   </td>
  					</tr>
                </table>
            </form>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                   <th class="r n_b_b" style="text-align:left;">
                    	<a href="javascript:void(0)" onclick="view(0,'look')"
                           class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-reset btn btn-sm btn-primary"><span
                                class="icon-search"></span>查 看</a>
                    	<a href="javascript:void(0)" onclick="view(0,'add')" id="fbox_grid-table_search"
                           class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-reset btn btn-sm btn-primary"><span
                                class="icon-plus-sign"></span>新 增</a>
                        <a href="javascript:void(0)" onclick="view(0,'update')" id="fbox_grid-table_search"
                           class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-reset btn btn-sm btn-primary"><span
                                class="icon-edit"></span>修  改</a>
                        <a href="javascript:void(0)" onclick="disableEn('stop')" id="fbox_grid-table_search"
                           class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-reset btn btn-sm btn-danger"><span
                                class="icon-lock"></span>停  用</a>
                        <a href="javascript:void(0)" onclick="disableEn('start')" id="fbox_grid-table_search"
                           class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-reset btn btn-sm btn-success"><span
                                class="icon-unlock"></span>启  用 </a>
                        <a href="javascript:void(0)" onclick="disableEn('delete')"
                           class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-search btn btn-sm btn-danger"><span
                                class="icon-trash"></span>删  除</a>
                    </th>
                </tr>
            </table>
        </div>
        <!--查询条件 end-->
			<div>
            	<table id="orglist" width="100%" border="0" cellspacing="0" cellpadding="0">
               
            	</table>
            	<div id="orglist_pager"></div>
        	</div>
        </div>
</div> 

</body>
</html>
