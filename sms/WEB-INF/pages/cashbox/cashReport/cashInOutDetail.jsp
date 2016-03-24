<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
    <title>钱箱现金平衡明细查询</title>
    <link rel="stylesheet" href="${ctx}/sms/statics/common/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/sms/statics/common/plugins/ztree/css/selectTree.css" type="text/css">
    <script type="text/javascript" src="${ctx}/sms/statics/common/plugins/ztree/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/common/plugins/ztree/js/jquery.ztree.excheck-3.5.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/common/plugins/ztree/js/jquery.ztree.exedit-3.5.js"></script>
    <script src="${ctx}/sms/statics/common/js/util.js"></script>

    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/cashbox/cashReport/cashInOutDetail.js"></script>

    <link href="${ctx}/sms/statics/common/css/css.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/jquery.easyui.min.js">
    </script>
    <link type="text/css" rel="stylesheet"
          href="${ctx}/sms/statics/common/js/jquery-easyui/themes/default/easyui.css"/>

    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/select2-3.4.1/select2.js"></script>
    <link rel="stylesheet" href="${ctx}/sms/statics/ace/plugins/select2-3.4.1/select2.css" type="text/css">
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/date/WdatePicker.js"></script>

    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/jquery.jqGrid.min.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/grid.locale-cn.js"></script>
</head>
<body>
<div class="wrap100 quickrecharge">

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
                明细查询
            </li>
            <li class="active">钱箱现金平衡明细查询</li>
        </ul>
        <!-- .breadcrumb -->
    </div>
    <%--<h1>钱箱列表管理</h1>--%>

    <div class="q_r_list">
        <!--交易记录查询条件 begin-->
        <div class="listTable">
            <form id="searchForm" action="#">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <th class="r" width="10%">所属网点 ：</th>
                        <td width="10%">
                            <input id="orgNames" type="text" readonly value="" class="select"
                                   name="orgNames"/>
                            <input id="orgCodes" type="hidden" readonly name="orgCodes"/>
                        </td>
                        <th class="r" width="8%">钱箱号：</th>
                        <td width="10%"><input name="searchCashBoxNo" id="searchCashBoxNo" class="inputW150"/>
                            </select>
                        </td>
                        <th class="r" width="12%">查询时间段：</th>
                        <td width="40%">
                            <input id="startDate" name="startDate" class="inputW150"
                                   onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                            -
                            <input id="endDate" name="endDate" class="inputW150"
                                   onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
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
        <div  >
            <table id="operateDetail" width="100%" border="0" cellspacing="0" cellpadding="0">

            </table>
            <div id="operateDetail_pager"></div>
        </div>
        <!--交易记录查询列表 end-->
    </div>
</div>
</body>
</html>
