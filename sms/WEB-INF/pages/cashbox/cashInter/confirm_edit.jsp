<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>

    <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/jquery.easyui.min.js"></script>
    <link type="text/css" rel="stylesheet"
          href="${ctx}/sms/statics/common/js/jquery-easyui/themes/default/easyui.css"/>

    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/cashbox/cashInter/confirm_edit.js"></script>
</head>

<div class="main-content">
    <div class="page-content min_style">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <form class="form-horizontal" role="form" id="editForm">
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right"> 调出钱箱号：</label>

                        <div class="col-xs-10">
                            <label id="calloutcashboxno" class="formlabel" ></label>
                        </div>
                    </div>
                    <div class="form-group">

                        <label class="col-sm-2 control-label no-padding-right"> 调入用户： </label>

                        <div class="col-xs-4">
                            <label id="callincashboxusername" class="formlabel" ></label>
                        </div>
                        <label class="col-sm-2 control-label no-padding-right"> 调入钱箱号： </label>

                        <div class="col-xs-4">
                            <label id="callincashboxno" class="formlabel" ></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right"> 调出金额(元)： </label>

                        <div class="col-xs-4">
                            <label id="intermodulationamount" class="formlabel" ></label>
                        </div>
                        <label class="col-sm-2 control-label no-padding-right"> 调出时间： </label>

                        <div class="col-xs-4">
                            <label id="calloutdate" class="formlabel" ></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right"> 申请备注：</label>

                        <div class="col-xs-10">
                            <textarea cols="60" name="comments" id="comments" readonly="readonly"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right"> 审核备注： </label>

                        <div class="col-xs-10">
                            <textarea cols="60" id="checkcomment" name="checkcomment"></textarea>
                        </div>
                    </div>
                    <div class="clearfix form-actions">
                        <div class="col-bt-center">
                            <button class="btn btn-success" type="button" id="confirmBtn">
                                <i class="ace-icon fa fa-check bigger-110 icon-save"></i>
                                确 认
                            </button>
                            <button class="btn btn-gray" type="button" id="closeBtn">
                                <i class="ace-icon fa fa-check bigger-110 icon-remove"></i>
                                关 闭
                            </button>
                        </div>
                    </div>
                    <input type="hidden" name="id" id="id" value="${id}"/>
                </form>
            </div>
        </div>
    </div>
</div>
</html>