<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>

    <link rel="stylesheet" href="${ctx}/sms/statics/common/plugins/ztree/css/zTreeStyle/zTreeStyle.css"
          type="text/css">
    <link rel="stylesheet" href="${ctx}/sms/statics/common/plugins/ztree/css/selectTree.css" type="text/css">
    <script type="text/javascript" src="${ctx}/sms/statics/common/plugins/ztree/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript"
            src="${ctx}/sms/statics/common/plugins/ztree/js/jquery.ztree.excheck-3.5.js"></script>
    <script type="text/javascript"
            src="${ctx}/sms/statics/common/plugins/ztree/js/jquery.ztree.exedit-3.5.js"></script>

    <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/jquery.easyui.min.js"></script>
    <link type="text/css" rel="stylesheet"
          href="${ctx}/sms/statics/common/js/jquery-easyui/themes/default/easyui.css"/>

    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/recharge/TerminalEdit.js"></script>

    <script type="text/javascript" src="${ctx}/sms/statics/common/plugins/validate/jquery.validate.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/common/plugins/validate/additional-methods.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/common/plugins/validate/messages_cn.js"></script>
</head>

<div class="main-content">
    <div class="page-content min_style">
        <div class="row">
            <div class="col-xs-12">
                <form class="form-horizontal" role="form" id="editForm">
                	<input id="cardTerminalId" name="cardTerminalId" type="hidden" class="inputW150" value="${bean.cardTerminalId}"/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right"> 自助终端编号： </label>
                        <div class="col-xs-4">
                            <input id="terminalCode" name="terminalCode" class="inputW150" value="${bean.terminalCode}"/>
                        </div>
                        <label class="col-sm-2 control-label no-padding-right"> 厂商： </label>
                        <div class="col-xs-4">
                            <input id="firmName" name="firmName" class="inputW150" value="${bean.firmName}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right"> 厂商联系电话： </label>
                        <div class="col-xs-4">
                            <input id="firmTel" name="firmTel" class="inputW150" value="${bean.firmTel}"/>
                        </div>
                        <label class="col-sm-2 control-label no-padding-right"> 部署地点： </label>
                        <div class="col-xs-4">
                            <input id="deployLocation" name="deployLocation" class="inputW150" value="${bean.deployLocation}"/>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right"> 钱箱号： </label>
                        <div class="col-xs-4">
                            <input id="cashboxNo" name="cashboxNo" class="inputW150" value="${bean.cashboxNo}"/>
                        </div>
                        <label class="col-sm-2 control-label no-padding-right"> 钱箱负责人： </label>
                        <div class="col-xs-4">
                            <input id="cashboxOwnerCode" name="cashboxOwnerCode" class="inputW150" value="${bean.cashboxOwnerCode}"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right"> 归属网点： </label>
                        <div class="col-xs-4">
                            <input id="orgCode" name="orgCode" class="inputW150" value="${bean.terminalCode}"/>
                        </div>
                    </div>

                    <div class="clearfix form-actions">
                        <div class="col-bt-center">
                            <button class="btn btn-primary" type="button" id="saveBtn">
                                <i class="ace-icon fa fa-check bigger-110 icon-save"></i>
                                保 存
                            </button>

                            <button class="btn btn-gray" type="button" id="closeBtn">
                                <i class="ace-icon fa fa-check bigger-110 icon-remove"></i>
                                关 闭
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</html>