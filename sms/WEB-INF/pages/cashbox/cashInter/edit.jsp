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

    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/cashbox/cashInter/edit.js"></script>

    <link rel="stylesheet" href="${ctx}/sms/statics/common/plugins/validate/jquery.validate.css"
          type="text/css">
    <script type="text/javascript" src="${ctx}/sms/statics/common/plugins/validate/jquery.validate.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/common/plugins/validate/additional-methods.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/common/plugins/validate/messages_cn.js"></script>
</head>

<div class="main-content">
    <div class="page-content min_style">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <form class="form-horizontal" role="form" id="editForm">
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right"> 调出钱箱号：</label>

                        <div class="col-xs-10">
                            <input id="calloutcashboxno" name="calloutcashboxno" type="hidden"/>
                            <label id="calloutcashboxnoView" class="formlabel"></label>
                        </div>
                    </div>
                    <div class="form-group">

                        <label class="col-sm-2 control-label no-padding-right must"> 调入用户： </label>

                        <div class="col-xs-4">
                            <input id="callincashboxusername" name="callincashboxusername" type="hidden"/>
                            <select id="callincashboxusercode" name="callincashboxusercode"
                                    onchange="changeCallinUser()">
                                <option value="-1">请选择调入用户</option>
                            </select>
                        </div>
                        <label class="col-sm-2 control-label no-padding-right"> 调入钱箱号： </label>

                        <div class="col-xs-4">
                            <input id="callincashboxno" name="callincashboxno" class="inputW150" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right must"> 调出金额(元)： </label>

                        <div class="col-xs-4">
                            <input id="intermodulationamount" name="intermodulationamount" class="inputW150"/>
                        </div>
                        <label class="col-sm-2 control-label no-padding-right"> 调出时间： </label>

                        <div class="col-xs-4">
                            <input id="calloutdate" name="calloutdate" type="hidden"/>
                            <label id="calloutdateView" class="formlabel"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right"> 备注：</label>

                        <div class="col-xs-10">
                            <textarea type="textarea" id="comments" name="comments" rows="3" cols="60"></textarea>
                        </div>
                    </div>
                    <div class="clearfix form-actions">
                        <div class="col-bt-center">
                            <button class="btn btn-primary" type="button" id="saveBtn">
                                <i class="ace-icon fa fa-check bigger-110 icon-save"></i>
                                确 认
                            </button>
                            <button class="btn btn-inverse" type="button" id="holdBtn">
                                <i class="ace-icon fa fa-check bigger-110 icon-lock"></i>
                                暂 存
                            </button>
                            <button class="btn btn-gray" type="button" id="closeBtn">
                                <i class="ace-icon fa fa-check bigger-110 icon-remove"></i>
                                关 闭
                            </button>
                        </div>
                    </div>
                    <input type="hidden" name="id" id="id" value="${id}"/>
                    <input type="hidden" name="calloutcashboxusername" id="calloutcashboxusername"/>
                    <input type="hidden" name="calloutcashboxusercode" id="calloutcashboxusercode"/>
                    <input type="hidden" name="orgcode" id="orgcode"/>
                    <input type="hidden" name="orgname" id="orgname"/>
                    <input type="hidden" id="usefulAmount"/>
                </form>
            </div>
        </div>
    </div>
</div>

</html>