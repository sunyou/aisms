<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
    <title>现金上缴申请</title>
    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/cashbox/deliver/confirm.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/date/WdatePicker.js"></script>

    <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/jquery.easyui.min.js"></script>
    <link type="text/css" rel="stylesheet"
          href="${ctx}/sms/statics/common/js/jquery-easyui/themes/default/easyui.css"/>

    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/jquery.jqGrid.min.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/grid.locale-cn.js"></script>
</head>
<body>
<div class="wrap100 quickrecharge">
    <%--<h1>现金上缴申请</h1>--%>
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
                    现金上缴
                </li>
                <li class="active">现金上缴审核</li>
            </ul>
            <!-- .breadcrumb -->
    </div>
    <div class="q_r_list">
        <!--交易记录查询条件 begin-->
        <div class="listTable">
            <form id="searchForm" action="#">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <th width="13%" class="r">申请单号：</th>
                        <td width="25%">
                            <input name="searchApplyNo" id="searchApplyNo" class="inputW170"/>
                        </td>
                        <th class="r">申请时间 ：</th>
                        <td>
                            <input id="applyStartDate" name="applyStartDate" class="inputW150"
                                   onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                            -
                            <input id="applyEndDate" name="applyEndDate" class="inputW150"
                                   onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                        </td></tr>
                    <tr>
                        <th class="r">钱箱号 ：</th>
                        <td><input name="searchCashBoxNo" id="searchCashBoxNo" class="inputW170"/>
                        </td>
                        <th class="r">申请单状态：</th>
                        <td ><select id="status" name="status" style="width:120px">
                            <option value="-1">请选择状态</option>
                        </select>
                        </td>
                    </tr>
                </table>
            </form>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <th class="r n_b_b">&nbsp;</th>
                    <td class="n_b_b">&nbsp;</td>
                    <th class="r n_b_b">&nbsp;</th>
                    <th colspan="3" class="r n_b_b">
                        <a href="javascript:void(0)" onclick="reloadGrid();"
                           class="fm-button ui-state-default ui-corner-all fm-button-icon-right ui-reset btn btn-sm btn-success"><span
                                class="icon-search"></span>查 询</a>
                        <a href="javascript:void(0)" onclick="com.ai.bdx.util.reset('searchForm');"
                           class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-search btn btn-sm btn-gray"><span
                                class="icon-retweet"></span>重 置</a>
                    </th>
                </tr>
            </table>
        </div>
        <!--交易记录查询条件 end-->

        <!--交易记录查询列表 begin-->
        <div>
            <table id="cashdeliver" width="100%" border="0" cellspacing="0" cellpadding="0">

            </table>
            <div id="cashdeliver_pager"></div>
        </div>
        <!--交易记录查询列表 end-->
    </div>
</div>
</body>
</html>
