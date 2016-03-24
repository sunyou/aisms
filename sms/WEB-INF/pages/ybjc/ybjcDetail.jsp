<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
    <title>医保稽查查看</title> 
     
   

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
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jquery/jquery.form.min.js"></script>   
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jquery/jquery.validate.min.js"></script>   
    
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/chosen/chosen.jquery.js"></script> 
        <script type="text/javascript" src="${ctx}/sms/statics/pages/js/ybjc/ybjcDetail.js"></script>
    
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
                             <input name="orgName" id="orgName" class="inputW120"  value="刘力"/>    
                        </div>
                        <label class="col-sm-3 control-label no-padding-right"> 性别： </label>
                        <div class="col-xs-3">
                           <input name="patientName" id="patientName" class="inputW120"  value="女" />
                        </div>
                        <label class="col-sm-3 control-label no-padding-right"> 年龄： </label>
                        <div class="col-xs-3">
                       		<input name="patientNamepy" id="patientNamepy" class="inputW120"  value="23"/>
                        </div>
                    </div>    
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right"> 身份证号： </label>
                        <div class="col-xs-3">                            
                             <input name="orgName" id="orgName" class="inputW120"  value="610404****4473"/>    
                        </div>
                        <label class="col-sm-3 control-label no-padding-right"> 联系方式： </label>
                        <div class="col-xs-3">
                           <input name="patientName" id="patientName" class="inputW120"  value="187****5671" />
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
                             <input name="orgName" id="orgName" class="inputW120"  value="王乐"/>    
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
                             <input name="orgName" id="orgName" class="inputW120"  value="一级医院"/>    
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
            <h1>&nbsp;&nbsp;&nbsp;住院信息</h1>
            <div class="col-xs-12 col-sm-12 col-md-12">                
                    <div class="form-group">                        
                        <label class="col-sm-3 control-label no-padding-right"> 病案号： </label>
                        <div class="col-xs-3">                         
                            <input name="sickNo" id="sickNo" class="inputW120"  value="CJ201416670001"/>  
                        </div>  
                         <label class="col-sm-3 control-label no-padding-right"> 住院次数： </label>
                        <div class="col-xs-3">                         
                            <input name="inCount" id="inCount" class="inputW120"  value="2"/>  
                        </div>  
                         <label class="col-sm-3 control-label no-padding-right"> 住院原因： </label>
                        <div class="col-xs-3">                         
                            <input name="reason" id="reason" class="inputW120"  value="病伤"/>  
                        </div>
                         </div>    
                    <div class="form-group">  
                         <label class="col-sm-3 control-label no-padding-right"> 入院诊断： </label>
                        <div class="col-xs-3">                         
                            <input name="inAdmission" id="inAdmission" class="inputW120"  value="发烧"/>  
                        </div>  
                         <label class="col-sm-3 control-label no-padding-right"> 出院诊断： </label>
                        <div class="col-xs-3">                         
                            <input name="outAdmission" id="outAdmission" class="inputW120"  value="不再发烧"/> 
                        </div>   
                          <label class="col-sm-3 control-label no-padding-right"> 住院时间： </label>
                        <div class="col-xs-3">                         
                            <input name="studyAccnumber" id="studyAccnumber" class="inputW120"  value="2015年3月份"/>  
                        </div> 
                         </div>    
                    <div class="form-group">
                          <label class="col-sm-3 control-label no-padding-right"> 出院时间： </label>
                        <div class="col-xs-3">                         
                            <input name="studyAccnumber" id="studyAccnumber" class="inputW120"  value="2015年4月份"/>  
                        </div> 
                         <label class="col-sm-3 control-label no-padding-right"> 住院天数： </label>
                        <div class="col-xs-3">                         
                            <input name="indays" id="indays" class="inputW120"  value="18"/>  
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
	
	<h1>&nbsp;&nbsp;&nbsp;检验检查信息</h1>
	<div class="fM_listTable2">
              <table id="configTab" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                 <tr>
		            <th width="6%" class="c">类别</th>            
		            <th width="8%" class="c">项目名称</th>            
		            <th width="15%" class="c">报告日期</th>
		            <th width="20%" class="c">报告医生</th> 
		            
		          </tr>
		          <tr tag="studyItem">
		            <td width="10%" align = "center"> 
		                                          抽查  	                
		            </td>  
		            <td width="10%" align = "center">
		               DD01
		            </td>       
		            <td width="10%" align = "center">
		               2015-12-03
 		            </td>        
		            <td width="10%" align = "center"align = "center">
		                                             李启动
 		            </td>  
		          </tr> 
		         <tr tag="studyItem">
		            <td width="10%" align = "center"> 
		                                          抽查  	                
		            </td>  
		            <td width="10%" align = "center">
		               DD02
		            </td>       
		            <td width="10%" align = "center">
		               2015-12-23
 		            </td>        
		            <td width="10%" align = "center"align = "center">
		                                            张泽明
 		            </td>  
		          </tr> 
              </tbody>
              </table>               
     </div>    
	
	<h1>&nbsp;&nbsp;&nbsp;手术信息</h1>
	<div class="fM_listTable2">
              <table id="configTab" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                 <tr>
		            <th width="6%" class="c"> 手术名称</th>            
		            <th width="6%" class="c">手术级别</th>
		            <th width="6%" class="c">手术日期</th>            
		            <th width="6%" class="c">手术医生</th>
		            <th width="6%" class="c">第一助手医生</th> 
		             <th width="6%" class="c">第二助手医生</th>            
		            <th width="6%" class="c">切口愈合等级</th>
		            <th width="6%" class="c">麻醉方法</th> 
		             <th width="6%" class="c">麻醉医师</th> 
		             <th width="6%" class="c">备注</th> 
		          </tr>
		          <tr tag="studyItem">
		            <td width="6%" align = "center"> 
		                                         微创  	                
		            </td>  
		            <td width="6%" align = "center">
		               3级
		            </td>       
		            <td width="6%" align = "center">
		               2015-12-04
 		            </td>        
		            <td width="6%" align = "center"align = "center">
		                                             李启明
 		            </td> 
                   <td width="6%" align = "center"> 
		                                          张泽明  	                
		            </td>  
		            <td width="6%" align = "center">
		                                            黄耀东
		            </td>       
		            <td width="6%" align = "center">
		               2级
 		            </td>        
		            <td width="6%" align = "center"align = "center">
		                                             注射
 		            </td>
 		               <td width="6%" align = "center"> 
		                                          徐达                
		            </td>  
		            <td width="6%" align = "center">
		                              非常成功
		            </td>       
		          </tr> 
		       <tr tag="studyItem">
		            <td width="10%" align = "center"> 
		                                         切除 	                
		            </td>  
		            <td width="6%" align = "center">
		               2级
		            </td>       
		            <td width="6%" align = "center">
		               2015-12-08
 		            </td>        
		            <td width="10%" align = "center"align = "center">
		                                             王菊生
 		            </td> 
                   <td width="6%" align = "center"> 
		                                          张泽明  	                
		            </td>  
		            <td width="6%" align = "center">
		                                            黄耀东
		            </td>       
		            <td width="6%" align = "center">
		               2级
 		            </td>        
		            <td width="6%" align = "center"align = "center">
		                                             注射
 		            </td>
 		               <td width="6%" align = "center"> 
		                                          徐达                
		            </td>  
		            <td width="6%" align = "center">
		                            无
		            </td>       
		          </tr>
              </tbody>
              </table>               
     </div>  
     <h1>&nbsp;&nbsp;&nbsp;费用信息</h1>
	<div class="fM_listTable2">
              <table id="configTab" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                 <tr>
		            <th width="6%" class="c">类别</th>            
		            <th width="8%" class="c">项目名称</th>            
		            <th width="15%" class="c">报告日期</th>
		            <th width="20%" class="c">报告医生</th> 
		            
		            
		          </tr>
		          <tr tag="studyItem">
		            <td width="10%" align = "center"> 
		                                          抽查  	                
		            </td>  
		            <td width="10%" align = "center">
		               DD01
		            </td>       
		            <td width="10%" align = "center">
		               2015-12-03
 		            </td>        
		            <td width="10%" align = "center"align = "center">
		                                             李启动
 		            </td>  
		          </tr> 
		         <tr tag="studyItem">
		            <td width="10%" align = "center"> 
		                                          抽查  	                
		            </td>  
		            <td width="10%" align = "center">
		               DD02
		            </td>       
		            <td width="10%" align = "center">
		               2015-12-23
 		            </td>        
		            <td width="10%" align = "center"align = "center">
		                                            张泽明
 		            </td>  
		          </tr> 
              </tbody>
              </table>               
     </div> 
     <div class="page-content min_style" style="padding:0px 0px 0px;">
        <div class="row">   
       <h1>&nbsp;&nbsp;&nbsp;稽查结果</h1>
                   <div class="col-xs-12 col-sm-12 col-md-12">                
                           <div class="form-group">                        
                        <label class="col-sm-3 control-label no-padding-right"> 住院病人是否在医院： </label>
                        <div class="col-xs-3">   
                        <input class="inputW40" type="radio" name="inHospital" id="inHospital1" value="是" />是
                        <input class="inputW40" type="radio" name="inHospital" id="inHospital2" value="否" />否
                                              
                        </div>  
                         <label class="col-sm-3 control-label no-padding-right"> 住院病人信息是否匹配： </label>
                        <div class="col-xs-3">                         
                           <input class="inputW40" type="radio" name="isTrue" id="isTrue1" value="是" />是
                           <input class="inputW40" type="radio" name="isTrue" id="isTrue2" value="否" />否
                        </div>  
                         <label class="col-sm-3 control-label no-padding-right"> 住院病人是否使用医保： </label>
                        <div class="col-xs-3">                         
                             <input class="inputW40" type="radio" name="isSocial" id="isSocial1" value="是" />是
                           <input class="inputW40" type="radio" name="isSocial" id="isSocial2" value="否" />否
                        </div>
                         </div>    
                    <div class="form-group">  
                         <label class="col-sm-3 control-label no-padding-right"> 信息差异描述： </label>
                        <div class="col-xs-3">                         
                            <input name="inAdmission" id="inAdmission" class="inputW120"  value="较大差异"/>  
                        </div>  
                         <label class="col-sm-3 control-label no-padding-right"> 对医院服务满意程度： </label>
                        <div class="col-xs-3">                         
                            <input name="outAdmission" id="outAdmission" class="inputW120"  value="一般"/> 
                        </div>   
                          <label class="col-sm-3 control-label no-padding-right"> 对医疗费用合理满意程度： </label>
                        <div class="col-xs-3">                         
                            <input name="studyAccnumber" id="studyAccnumber" class="inputW120"  value="不满意"/>  
                        </div> 
                         </div>    
                    <div class="form-group">
                          <label class="col-sm-3 control-label no-padding-right"> 意见与建议： </label>
                          <div class="col-xs-3">                         
                            <input name="studyAccnumber" id="studyAccnumber" class="inputW120"  value="建议稽查"/>  
                        </div> 
                    </div>                                                     
              </div>   
            </div>   
       </div>   
     <h1>&nbsp;&nbsp;&nbsp;任务处理日志</h1>
	<div class="fM_listTable2">
              <table id="configTab" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                 <tr>
		            <th width="6%" class="c">处理时间</th>            
		            <th width="6%" class="c">处理环节</th>            
		            <th width="6%" class="c">处理人</th>
		            
		          </tr>
		          <tr tag="studyItem">
		            <td width="10%" align = "center"> 
		                  2015-12-03 	                
		            </td>  
		            <td width="10%" align = "center">
		                                              取证环节
		            </td>       
		            <td width="10%" align = "center">
		                                          李明霞
 		            </td>        
		          </tr> 
		          <tr tag="studyItem">
		            <td width="10%" align = "center"> 
		                  2015-12-13 	                
		            </td>  
		            <td width="10%" align = "center">
		                                             立案环节
		            </td>       
		            <td width="10%" align = "center">
		                                          李明霞
 		            </td>        
		          </tr> 
              </tbody>
              </table>               
     </div>   
     
     
     
     
	</form>	
</div> 
 

</body>
</html>
