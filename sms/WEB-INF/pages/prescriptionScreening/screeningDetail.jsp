<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
    <title>大处方筛查查看</title> 
     
   

    <link type="text/css" rel="stylesheet" href="${ctx}/sms/statics/common/js/jquery-easyui/themes/default/easyui.css"/>
     <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/jquery.easyui.min.js"></script>
    
    <link type="text/css" rel="stylesheet" href="${ctx}/sms/statics/common/js/date/skin/WdatePicker.css"/>
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/date/WdatePicker.js"></script> 
    
    <link href="${ctx}/sms/statics/pages/css/index/css/public.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/sms/statics/common/css/css.css" rel="stylesheet" type="text/css"/> 
    <link href="${ctx}/sms/statics/pages/css/index/css/detail.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/sms/statics/pages/css/index/css/icon.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/sms/statics/pages/css/index/css/inner.css" rel="stylesheet" type="text/css"/>
         
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/jquery.jqGrid.min.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/grid.locale-cn.js"></script>   
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/common/plugins/PYjm.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jquery/jquery.form.min.js"></script>   
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jquery/jquery.validate.min.js"></script>   
    
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jquery/validate.expand.js"></script>  
     
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/chosen/chosen.jquery.js"></script> 
        <script type="text/javascript" src="${ctx}/sms/statics/pages/js/prescriptionScreening/screeningDrug.js"></script>
    
    <!-- 盖掉bootstrap样式 -->
    <style type="text/css">
    label.help-block-new {
	    display: block;
	    margin-top: -30px;
	    margin-left: 180px;
	    margin-bottom: 10px;
	    color: #ff7777
    }    
    .main-content h1{ 
    background:#B9F1DE; 
<%--    border-top-left-radius:10px; --%>
<%--    border-top-right-radius:10px; --%>
    height:34px; 
    color:#09245F; 
    font-size:16px; 
    text-indent:10px; 
    line-height:34px;}
    
    /*库存数量详情 表单 begin*/
	.main-content .fM_listTable2{ margin:auto; background:#fff; width:100%; border-collapse: separate; border-left: 1px solid #eee; border-top: 1px solid #eee; overflow-x: auto; clear:both; font-size:14px; }
	.main-content .fM_listTable2 th{border-bottom: 1px solid #eee; border-right: 1px solid #eee;height: 18px;padding: 10px 10px;text-align: center; background:#f8f8f8; color:#777; font-weight:700; border-bottom: 1px solid #eee; }
	.main-content .fM_listTable2 td{border-bottom: 1px solid #eee; border-right: 1px solid #eee; line-height: 22px; padding: 10px 3px; /*text-align:center;*/ vertical-align: top; color:#444;}
	 
	.main-content .col-bt-right{text-align:right;margin-right:20px;}
	.col-sm-3{width:16%;}
	.col-xs-3{width:16%;}
	.row{margin-right:0px;margin-left:0px;}
    </style>
     
    
</head>
<body> 
<div class="main-content">    
    <form class="form-horizontal" id="patientRegForm">
     
    <div class="page-content min_style" style="padding:0px 0px 0px;">
        <div class="row">            
            <h1>&nbsp;&nbsp;&nbsp;患者信息 
            </h1>
              
            <div class="col-xs-12 col-sm-12 col-md-12">                
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right"> 姓名： </label>
                        <div class="col-xs-3">                            
                             <input name="orgName" id="orgName" class="inputW120"  value="王力"/>    
                        </div>
                        <label class="col-sm-3 control-label no-padding-right"> 性别： </label>
                        <div class="col-xs-3">
                           <input name="patientName" id="patientName" class="inputW120"  value="男" />
                        </div>
                        <label class="col-sm-3 control-label no-padding-right"> 年龄： </label>
                        <div class="col-xs-3">
                       		<input name="patientNamepy" id="patientNamepy" class="inputW120"  value="43"/>
                        </div>
                    </div>    
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right"> 身份证号： </label>
                        <div class="col-xs-3">                            
                             <input name="orgName" id="orgName" class="inputW120"  value="610404****4473"/>    
                        </div>
                        <label class="col-sm-3 control-label no-padding-right"> 联系方式： </label>
                        <div class="col-xs-3">
                           <input name="patientName" id="patientName" class="inputW120"  value="186****5671" />
                        </div> 
                    </div>                                                
			</div>		   
		</div>	
	</div>
	 <div class="page-content min_style" style="padding:0px 0px 0px;">
        <div class="row">
            
            <h1>&nbsp;&nbsp;&nbsp;医生信息
            </h1>
              
            <div class="col-xs-12 col-sm-12 col-md-12">                
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right"> 姓名： </label>
                        <div class="col-xs-3">                            
                             <input name="orgName" id="orgName" class="inputW120"  value="张保乐"/>    
                        </div>
                        <label class="col-sm-3 control-label no-padding-right"> 身份证号： </label>
                        <div class="col-xs-3">
                           <input name="patientName" id="patientName" class="inputW120"  value="610404****4473" />
                        </div>
                        <label class="col-sm-3 control-label no-padding-right"> 机构所在行政区划： </label>
                        <div class="col-xs-3">
                       		<input name="patientNamepy" id="patientNamepy" class="inputW120"  value="秦都区"/>
                        </div>
                    </div>    
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right"> 机构类别： </label>
                        <div class="col-xs-3">                            
                             <input name="orgName" id="orgName" class="inputW120"  value="三级医院"/>    
                        </div>
                        <label class="col-sm-3 control-label no-padding-right"> 机构名称： </label>
                        <div class="col-xs-3">
                           <input name="patientName" id="patientName" class="inputW120"  value="陕中附院" />
                        </div> 
                        <label class="col-sm-3 control-label no-padding-right"> 科室名称： </label>
                        <div class="col-xs-3">
                           <input name="patientName" id="patientName" class="inputW120"  value="普外科" />
                        </div> 
                    </div>                                                
			</div>		   
		</div>	
	</div>
	
	<div class="page-content min_style" style="padding:0px 0px 0px;">
        <div class="row">            
            <h1>&nbsp;&nbsp;&nbsp;就诊信息</h1>
            <div class="col-xs-12 col-sm-12 col-md-12">                
                    <div class="form-group">                        
                        <label class="col-sm-3 control-label no-padding-right"> 就诊时间： </label>
                        <div class="col-xs-3">                         
                            <input name="studyAccnumber" id="studyAccnumber" class="inputW120"  value="2015年3月份"/>  
                        </div>   
                         <label class="col-sm-3 control-label no-padding-right"> 诊断： </label>
                        <div class="col-xs-3">                         
                            <input name="studyAccnumber" id="studyAccnumber" class="inputW120"  value="感冒"/>  
                        </div>                        
                    </div>                                                     
			</div>	
			<div>
	           	<table id="druglist" width="100%" border="0" cellspacing="0" cellpadding="0">
	              
	           	</table>
	           	<div id="druglist_pager"></div>
	       	</div>
			
		</div>	
	</div>
	
	<h1>&nbsp;&nbsp;&nbsp;违反规则</h1>
	<div class="fM_listTable2">
              <table id="configTab" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                 <tr>
		            <th width="6%" class="c">序号</th>            
		            <th width="8%" class="c">规则编码</th>            
		            <th width="15%" class="c">规则名称</th>
		            <th width="20%" class="c">规则描述</th> 
		          </tr>
		          <tr tag="studyItem">
		            <td width="10%" align = "center"> 
		               1  	                
		            </td>  
		            <td width="10%" align = "center">
		               001
		            </td>       
		            <td width="10%" align = "center">
		                                                 住院抗菌药物使用过量
 		            </td>        
		            <td width="10%" align = "center"align = "center">
		                                               使用抗菌药品住院人次占住院总人次的比例超过N%以上（含）
 		            </td>  
		          </tr> 
		          <tr tag="studyItem">
		            <td width="10%" align = "center"> 
		               2  	                
		            </td>  
		            <td width="10%" align = "center">
		               001
		            </td>       
		            <td width="10%" align = "center">
		                                                 住院抗菌药物使用过量
 		            </td>        
		            <td width="10%" align = "center"align = "center">
		                                               使用抗菌药品住院人次占住院总人次的比例超过N%以上（含）
 		            </td>  
		          </tr> 
              </tbody>
              </table>               
     </div>    
	
	</form>	
</div> 
 

</body>
</html>
