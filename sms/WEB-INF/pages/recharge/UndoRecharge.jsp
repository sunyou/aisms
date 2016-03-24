<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>  
    <%@ include file="/common/meta.jsp"%>
    <title>充值撤销</title>
    <link href="${ctx}/sms/statics/common/css/css.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/jquery.easyui.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${ctx}/sms/statics/common/js/jquery-easyui/themes/default/easyui.css"/>
    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/recharge/UndoRecharge.js"></script> 
</head>
<body>
<object ID="readOCX" width="0" height="0" CLASSID="clsid:{D4BA49A3-6EC2-4A4F-B52D-32ED1A7A7641}"></object>
<div class="breadcrumbs" id="breadcrumbs">
    <script type="text/javascript">
        try {
            ace.settings.check('breadcrumbs', 'fixed')
        } catch (e) {
        }
    </script>

    <ul class="breadcrumb" style="margin-top: 8px;">
        <li>
            <i class="icon-home home-icon"></i>
            充值撤销
        </li>
        <li class="active">充值撤销</li>
    </ul>
    <!-- .breadcrumb -->
</div>
    <div class="wrap quickrecharge">
    <div class="q_r_list">
   
        <!--充值 end-->
        
        <!--最近一次充值信息 begin-->
        <h2><span class="active"><i class="r_i_marking">&nbsp;</i>最近一次充值信息</span></h2>
    	<div class="listTable">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <th width="10%" class="r">充值时间：</th>
            <td width="15%"><label id="czsj"></label></td>
            <th width="16%" class="r">充值类型：</th>
            <td width="13%"><label id="czlx"></label></td>
            <th width="15%" class="r">充值后存在消费：</th>
            <td width="11%"><label id="czhczxf"></label></td>
          </tr>
          <tr>
            <th class="r">充值金额：</th>
            <td><label id="czje"></label></td>
            <th class="r">充值撤销金额：</th>
            <td><label id="czcxje"></label></td>
            <th class="r">充值撤销后余额：</th>
            <td><label id="czcxhye"></label></td>
          </tr>
          <tr>
            <td colspan="6" style="text-align: right;">
            <a href="javascript:void(0)" onclick="ReadCard()" id="fbox_grid-table_search"
                   class="fm-button ui-state-default ui-corner-all fm-button-icon-right ui-reset btn btn-sm btn-primary"><span
                        class="icon-credit-card"></span>读 卡</a>
                &nbsp;
                <button class="btn btn-success" type="button" id="closeBtn" onclick="ConfirmUndoRecharge()">
                    <i class="ace-icon fa fa-check bigger-110 icon-remove"></i>
                    撤销充值
                </button>
            </td>
          </tr>
        </table>    
        </div>
        <!--最近一次充值信息 end-->
        
        <!--卡片基本信息 begin-->
        <h2><span class="active"><i class="r_i_marking">&nbsp;</i>卡片基本信息</span></h2>
    	<div class="listTable">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <th width="10%" class="r">卡类型：</th>
            <td width="15%"><label id="cardtype"></label></td>
            <th width="16%" class="r">卡型号：</th>
            <td width="13%"><label id="cardModel"></label></td>
            <th width="15%" class="r">卡子类型：</th>
            <td width="11%"><label id="daugherCardType"></label></td>
          </tr>
          <tr>
            <th class="r">卡有效期：</th>
            <td><label id="cardValidity"></label></td>
            <th class="r">押金：</th>
            <td><label id="deposit"></label>元</td>
            <th class="r">发卡序列号：</th>
            <td><label id="cardSerial"></label></td>
          </tr>
          <tr>
            <th class="r">芯片序列号:</th>
            <td><label id="chipSerial"></label></td>
            <th class="r">账面余额：</th>
            <td><label id="crdbalance"></label></td>
            <th class="r">发卡时间：</th>
            <td><label id="cardTime"></label></td>
          </tr>
          <tr>
            <th width="13%" class="r">卡号：</th>
            <td width="18%"><label id="cardNo"></label></td>
            <th width="19%" class="r">卡余额：</th>
            <td width="22%"><strong><label id="crdrealbal"></label></strong></td>
            <th width="14%" class="r">卡状态：</th>
            <td width="14%"><label id="cardStatusDesc"></label><input type="hidden" id="cardStatus"/></td>
          </tr>
        </table>    
        </div>
        <!--卡片基本信息 end-->
        
        <!--持卡人基本信息 begin-->
        <h2><span class="active"><i class="r_i_marking">&nbsp;</i>持卡人基本信息</span></h2>
    	<div class="listTable">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <th width="10%" class="r">姓名：</th>
            <td width="15%"><label id="name"></label></td>
            <th width="16%" class="r">证件类型：</th>
            <td width="13%">身份证</td>
            <th width="15%" class="r">号码：</th>
            <td width="11%"><label id="idNo"></label></td>
          </tr>
          <tr>
            <th class="r">性别：</th>
            <td><label id="sex"></label></td>
            <th class="r">民族：</th>
            <td><label id="nation"></label></td>
            <th class="r">持卡人类型：</th>
            <td><label id="cardholderType"></label></td>
          </tr>
          <tr>
            <th class="r">联系电话:</th>
            <td><label id="phone"></label></td>
            <th class="r">通信地址：</th>
            <td><label id="address"></label></td>
            <th class="r">单位名称：</th>
            <td><label id="unit"></label></td>
          </tr>
        </table>    
        </div>
        <!--持卡人基本信息 end-->

  </div>
</div>
<div class="wrap700 quickrecharge" id="divConfirm" closed="true">

    <div class="q_r_list">
    
        <!--充值信息 begin-->
        <h2><span class="active"><i class="r_i_marking">&nbsp;</i>充值撤销信息</span></h2>
    	<div class="listTable">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <th width="13%" class="r">卡号：</th>
            <td width="18%"><label id="cardNo2"></label></td>
            <th class="r">业务类型：</th>
            <td><label id="rechargeType2"></label></td>
          </tr>
          <tr>
            <th class="r">充值金额：</th>
            <td><label id="czje2"></label></td>
            <th class="r">充值时间：</th>
            <td><label id="rechargeTime2"></label></td>
          </tr>
          <tr>
            <th class="r">卡内余额：</th>
            <td><label id="knye2"></label></td>
            <th class="r">充值撤销后余额：</th>
            <td><label id="czcxhye2"></label></td>
          </tr>
          <tr>
            <th width="19%" class="r">持卡人姓名：</th>
            <td width="22%"><label id="name2"></label></td>
            <th class="r">卡类型：</th>
            <td><label id="crdtype2"></label></td>
          </tr>
         <tr>
         	<th width="19%" class="r">持卡人类型：</th>
            <td width="22%"><label id="cardholderType2"></label></td>
            <th class="r">卡状态：</th>
            <td><label id="cardStatus2"></label></td>
          </tr>
          <tr>
            <th class="r">网点名称：</th>
            <td><label id="wdmc"></label></td>
            <th class="r">操作员：</th>
            <td><label id="czy"></label></td>
          </tr>
          <tr>
            <th colspan="4" class="c">
                <button onclick="UndoRecharge();" class="btn btn-primary" type="button">
                    <i class="ace-icon fa fa-check bigger-110 icon-save"></i>确 认
                </button>
                　
                <button onclick="$('#divConfirm').dialog('close')" class="btn btn-gray" type="button"><i
                        class="ace-icon fa fa-check bigger-110 icon-remove"></i>取 消
                </button>
          </tr>
        </table>    
   		</div>
        <!--充值信息 end-->
        


  </div>
</div>
  </body>
</html>
