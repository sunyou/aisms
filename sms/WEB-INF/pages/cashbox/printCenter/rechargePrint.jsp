<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
<script language="javascript"> 
var GLOBAL = {
    WEBROOT:"${ctx}"
};
</script>
<script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-migrate-1.0.0.js"></script>

<script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery.jqprint-0.3.js"></script>
  <script type="text/javascript">
    function GetPageHeight() {
	    var nHeight = (document.body.scrollHeight);
	    return nHeight;
    }
  
	function logout(){
	     //if(confirm("确定要退出吗？")){
	              var browserName=navigator.appName;
	              if (browserName=="Netscape"){
	                    window.open('', '_self', '');
	                    window.close();
	              }
	              if (browserName=="Microsoft Internet Explorer") { 
	                    window.parent.opener = "whocares"; 
	                    window.parent.close(); 
	              }
	     //}
	   }
	
	function print(){
		$("#pInfo").jqprint();
	}    
</script>
  <style>
<!--
p {
  margin-top: 0;
  margin-bottom: 0
}

.style1 {
  color: #000000
}

.style4 {
  font-size: 34px
}

.style9 {
  font-size: 32px;
  font-family: "华文中宋";
  color: #000000;
}

.style10 {
  font-size: 28px;
  font-family: "华文中宋";
}

.STYLE29 {
  font-size: 24px;
  font-family: "华文中宋";
}
-->
</style>
   
</head>
<style>
@media print {
  .NoPrint {
    display: none
  }
}

body,td,th {
  font-size: 16px;
}

body {
  
}

h1 {
  page-break-after: always
}

.STYLE11 {
  color: #FF0000;
  font-size: 28px;
}

.STYLE19 {
  font-size: 16pt;
  color: #000000;
  font-family: "宋体";
}

.STYLEZXY {
  font-size: 12px;
}

.styleImgDesc {
  font-size: 12px;
}

.STYLE24 {
  font-size: 28px
}

.STYLE25 {
  font-size: 20px
}

.STYLE26 {
  font-size: 14px
}

.STYLE27 {
  font-size: 14
}
</style>
<body>
  
	  
  <table width="350" height="320" border="0" align="center" id="pInfo"
    cellpadding="0" cellspacing="0">
    <tr>
      <td height="13" colspan="4" align="left">
         <p align="center">
            <b><span class="STYLE11"><span class="STYLE19">咸阳市惠民一卡通充值小票</span>
            </span>
            </b>
          </p>
      </td>
    </tr>
    
    <tr height="0" valign="top">
      <td height="2" colspan="4">
        <hr noshade color="#000000" size="1">
      </td>
    </tr> 
    <tr>
      <td width="180" height="13" >
        <span class="STYLE26"><span>交易类型：</span>自动充值</span>
      </td>  
    </tr>
    <tr> 
      <td width="180" height="13">
        <span class="STYLE26"><span>交易流水号：</span>C00000000001</span>u
      </td> 
    </tr> 
    <tr>
    	 <td width="180" height="13">
       </td>
    </tr>
    <tr>  
      <td width="180" height="13">
        <span class="STYLE26"><span>姓名:</span>曹瑞杰</span>
      </td>
    </tr>
    <tr>  
      <td width="180" height="13">
        <span class="STYLE26"><span>身份证号:</span>622723198511130410</span>
      </td>
    </tr>
    
    <tr>
    	 <td width="180" height="13">
       </td>
    </tr>
    <tr>  
      <td width="180" height="13">
        <span class="STYLE26"><span>充值方式:</span>现金</span>
      </td>
    </tr>
    <tr>  
      <td width="180" height="13">
        <span class="STYLE26"><span>充值前金额:</span>130</span>
      </td>
    </tr>
    <tr>  
      <td width="180" height="13">
        <span class="STYLE26"><span>充值金额:</span>70</span>
      </td>
    </tr>
    <tr>  
      <td width="180" height="13">
        <span class="STYLE26"><span>充值后金额:</span>200</span>
      </td>
    </tr>
         
    <tr height="0" valign="top">
      <td height="2" colspan="4">
        <hr noshade color="#000000" size="1">
      </td>
    </tr>
    
    <tr>  
      <td width="180" height="15">
        <span class="STYLE26"><span>操作员编号:</span>000001231</span>
      </td>
    </tr>
    <tr>  
      <td width="180" height="13">
        <span class="STYLE26"><span>操作员姓名:</span>曹瑞杰</span>
      </td>
    </tr>
    <tr>  
      <td width="180" height="13">
        <span class="STYLE26"><span>交易结果:</span>成功</span>
      </td>
    </tr>
    <tr>  
      <td width="180" height="13">
        <span class="STYLE26"><span>打印时间:</span>2015-11-15</span>
      </td>
    </tr>
    
    <tr height="0" valign="top">
      <td height="2" colspan="4">
        <hr noshade color="#000000" size="1">
      </td>
    </tr>
    <tr>  
      <td width="220" height="13">
        <span class="STYLE26">温馨提示：<br/>
        1.感谢您办理充值业务，账户充值后可以进行挂号、缴费业务。 <br/>
        2.卡片遗失或损坏，请速到办卡处凭有效身份证件补办。 
        </span>                 
<%--        <p align="center" class="styleImgDesc" style="margin-left:-60%">温馨提示：</p>--%>
<%--		<p align="center" class="styleImgDesc" style="">1.感谢您办理充值业务，账户充值后可以进行挂号、缴费业务。 </p> --%>
<%--		<p align="center" class="styleImgDesc" style="margin-left:-35px;">2.卡片遗失或损坏，请速到办卡处凭有效身份证件补办。</p>--%>
      </td>
    </tr>
    
  </table>

	
 
<div class="page-content" style="text-align:center;margin-top:20px;">
       <button type="button" class="btn btn-primary" onclick="print()">打 印</button>
       <button type="button" class="btn btn-pink" onclick="logout()">关 闭</button> 
</div> 

</body>
</html>