<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
    <title>钱箱列表管理</title>

    <link rel="stylesheet" href="${ctx}/sms/statics/common/plugins/ztree/css/zTreeStyle/zTreeStyle.css"
          type="text/css">
    <link rel="stylesheet" href="${ctx}/sms/statics/common/plugins/ztree/css/selectTree.css" type="text/css">

    <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/jquery.easyui.min.js"></script>
    <link type="text/css" rel="stylesheet"
          href="${ctx}/sms/statics/common/js/jquery-easyui/themes/default/easyui.css"/>

    <script type="text/javascript" src="${ctx}/sms/statics/common/plugins/ztree/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript"
            src="${ctx}/sms/statics/common/plugins/ztree/js/jquery.ztree.excheck-3.5.js"></script>
    <script type="text/javascript"
            src="${ctx}/sms/statics/common/plugins/ztree/js/jquery.ztree.exedit-3.5.js"></script>

    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/jquery.jqGrid.min.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/grid.locale-cn.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/cashbox/mgr/list.js"></script>
    <script type="text/javascript"
            src="${ctx}/sms/statics/common/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
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
                <a href="cashbox/page/list">钱箱管理</a>
            </li>
            <li class="active">钱箱查询</li>
        </ul>
        <!-- .breadcrumb -->
    </div>
    <div class="q_r_list" style="width:98%; ">
        <!--交易记录查询条件 begin-->
        <div class="listTable">
            <form id="searchForm" action="#">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <th class="r" width="13%">所属网点 ：</th>
                        <td width="18%">
                            <input id="orgNames" type="text" readonly value="" class="select"
                                   name="orgNames"/>
                            <input id="orgCodes" type="hidden" readonly name="orgCodes"/>

                        </td>
                        <th class="r" width="13%">钱箱状态：</th>
                        <td width="18%"><select id="status" name="status" style="width:120px">
                            <option value="-1">请选择状态</option>
                        </select>
                        </td>
                        <th width="13%" class="r">拥有者：</th>
                        <td width="18%">
                            <input name="cashBoxOwnerName" id="searchcashBoxOwnerName" class="inputW160"/>
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
                        <a href="javascript:void(0)" onclick="edit()" id="fbox_grid-table_search"
                           class="fm-button ui-state-default ui-corner-all fm-button-icon-right ui-reset btn btn-sm btn-primary"><span
                                class="icon-plus-sign"></span>新 增</a>
                        <a href="javascript:void(0)" onclick="cancel()" id="fbox_grid-table_cancel"
                           class="fm-button ui-state-default ui-corner-all fm-button-icon-right ui-reset btn btn-sm btn-info"><span
                                class="icon-cancel"></span>注 销</a>
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
        <div>
            <table id="cashbox" width="100%" border="0" cellspacing="0" cellpadding="0">

            </table>
            <div id="cash_pager"></div>
        </div>
    </div>
</div>
</body>
</html>
