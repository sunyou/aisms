<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>

    <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/jquery.easyui.min.js"></script>
    <link type="text/css" rel="stylesheet"
          href="${ctx}/sms/statics/common/js/jquery-easyui/themes/default/easyui.css"/>

    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/cashbox/deliver/edit.js"></script>

    <link rel="stylesheet" href="${ctx}/sms/statics/common/plugins/validate/jquery.validate.css"
          type="text/css">
    <script type="text/javascript" src="${ctx}/sms/statics/common/plugins/validate/jquery.validate.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/common/plugins/validate/additional-methods.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/common/plugins/validate/messages_cn.js"></script>
</head>

<div class="main-content">
    <div class="page-content min_style">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12" style="padding:6px;">
                <form class="form-horizontal" role="form" id="editForm">
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right"> 申请单号： </label>

                        <div class="col-xs-4">
                            <input id="applyno" name="applyno" type="hidden"/>
                            <label id="applynoView" class="formlabel"></label>
                        </div>
                        <label class="col-sm-2 control-label no-padding-right"> 申请时间： </label>

                        <div class="col-xs-4">
                            <input id="applydate" name="applydate" type="hidden"/>
                            <label id="applydateView" class="formlabel"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right"> 上缴用户：</label>

                        <div class="col-xs-10">
                            <input id="delivercashboxusername" name="delivercashboxusername" type="hidden"/>
                            <input id="delivercashboxusercode" name="delivercashboxusercode" type="hidden"/>
                            <label id="delivercashboxusernameView" class="formlabel"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right"> 上缴钱箱号： </label>

                        <div class="col-xs-4">
                            <input id="delivercashboxno" name="delivercashboxno" type="hidden"/>
                            <label id="delivercashboxnoView" class="formlabel"></label>
                        </div>
                        <label class="col-sm-2 control-label no-padding-right must"> 上缴金额(元)： </label>

                        <div class="col-xs-4">
                            <input id="applyamount" name="applyamount" class="inputW150"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right must"> 接收用户： </label>

                        <div class="col-xs-4">
                            <input id="backupcashboxusername" name="backupcashboxusername" type="hidden"/>
                            <select id="backupcashboxusercode" name="backupcashboxusercode"
                                    onchange="changeBackCashbox()">
                                <option value="-1">请选择接收用户</option>
                            </select>
                        </div>
                        <label class="col-sm-2 control-label no-padding-right"> 接收钱箱号：</label>

                        <div class="col-xs-4">
                            <input id="backupcashboxno" name="backupcashboxno" class="inputW150" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right"> 备注： </label>

                        <div class="col-xs-10">
                            <textarea rows="5" cols="60" name="applycomment" id="applycomment"></textarea>
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
                    <input type="hidden" id="usefulAmount"/>
                </form>
            </div>
        </div>
    </div>
</div>

</html>