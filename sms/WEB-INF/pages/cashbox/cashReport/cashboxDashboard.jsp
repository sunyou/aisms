<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
    <title>我的网点</title>

    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/cashbox/cashReport/cashboxDashboard.js"></script>

    <link href="${ctx}/sms/statics/common/css/css.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/jquery.easyui.min.js">
    </script>
    <link type="text/css" rel="stylesheet"
          href="${ctx}/sms/statics/common/js/jquery-easyui/themes/default/easyui.css"/>
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/date/WdatePicker.js"></script>

    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/jquery.jqGrid.min.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/grid.locale-cn.js"></script>
</head>
<body>
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
            <a href="cashReport/page/cashboxDashboard">我的钱箱</a>
        </li>
        <li class="active">我的钱箱</li>
    </ul>
    <!-- .breadcrumb -->
</div>

<div class="wrap quickrecharge">
    <div class="q_r_list">

        <!--充值 begin-->
        <h2><span class="active"><i class="r_i_marking">&nbsp;</i>基本信息</span></h2>

        <div class="listTable">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <th width="13%" class="r">所属网点：</th>
                    <td colspan="3"><label id="orgName"></label></td>
                </tr>
                <tr>
                    <th width="13%" class="r">钱箱号：</th>
                    <td width="18%"><label id="cashboxNo"></label></td>
                    <th width="19%" class="r">拥有者：</th>
                    <td width="22%"><strong><label id="owner"></label></strong></td>
                </tr>
                <tr>
                    <th class="r">钱箱余额(元)：</th>
                    <td><label id="cashboxAmount"></label></td>
                    <th class="r">冻结余额(元)：</th>
                    <td><label id="freezingAmount"/></td>
                </tr>
                <tr>
                    <th class="r">钱箱创建时间：</th>
                    <td><label id="createDate"></label></td>
                    <th class="r">创建人：</th>
                    <td><label id="creator"/></td>
                </tr>
                <tr>
                    <th class="r">本日收入(元)：</th>
                    <td><label id="dayIncome"></label></td>
                    <th class="r">本日支出(元)：</th>
                    <td><label id="dayOutcome"/></td>
                </tr>
            </table>
        </div>
        <!--充值 end-->


        <%--<!--卡片基本信息 begin-->
        <h2><span class="active"><i class="r_i_marking">&nbsp;</i>网点今日报表</span></h2>
        <div class="listTable">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <th width="10%" class="r">上日余额：</th>
                    <td width="15%"><label id="crdtype"></label></td>
                    <th width="16%" class="r">本日收入：</th>
                    <td width="13%"><label id="cardModel"></label></td>
                    <th width="15%" class="r">本日调入：</th>
                    <td width="11%"><label id="daugherCardType"></label></td>
                </tr>
                <tr>
                    <th class="r">本日支出：</th>
                    <td><label id="cardValidity"></label></td>
                    <th class="r">本日调出：</th>
                    <td><label id="deposit"></label></td>
                    <th class="r">结存：</th>
                    <td><label id="cardSerial"></label></td>
                </tr>
            </table>
        </div>
        <!--卡片基本信息 end-->--%>
        <h2><span class="active"><i class="r_i_marking">&nbsp;</i>报表详单</span></h2>

        <div style="padding-left: 0px padding-right:0px">
            <div class="tabbable" style=" margin-top:10px">
                <ul class="nav nav-tabs padding-12 tab-color-blue background-blue" id="myTab4">
                    <li class="active">
                        <a data-toggle="tab" href="#cashDeliverStatsDiv" aria-expanded="true">上缴明细</a>
                    </li>

                    <li class="">
                        <a data-toggle="tab" href="#cashInterStatsDiv" aria-expanded="false">互调明细</a>
                    </li>

                    <li class="">
                        <a data-toggle="tab" href="#prettyCashStatsDiv" aria-expanded="false">备用金申领明细</a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div id="cashDeliverStatsDiv" class="tab-pane active">

                        <div class="listTable">
                            <form id="cashDeliverStatsForm">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <th class="r" width="12%">查询时间段：</th>
                                        <td width="40%">
                                            <input id="cashDeliverStats_startDate" class="inputW160"
                                                   onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                                            -
                                            <input id="cashDeliverStats_endDate" class="inputW160"
                                                   onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                                        </td>
                                        <th class="r n_b_b">
                                            <a href="javascript:void(0)" onclick="cashDeliverStatsReloadGrid();"
                                               class="fm-button ui-state-default ui-corner-all fm-button-icon-right ui-reset btn btn-sm btn-success"><span
                                                    class="icon-search"></span>查 询</a>
                                            <a href="javascript:void(0)"
                                               onclick="com.ai.bdx.util.reset('cashDeliverStatsForm');"
                                               class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-search btn btn-sm btn-gray"><span
                                                    class="icon-retweet"></span>重 置</a>
                                        </th>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div>
                            <table id="cashDeliverStats" width="100%" border="0" cellspacing="0" cellpadding="0">
                            </table>
                            <div id="cashDeliverStats_pager"></div>
                        </div>
                    </div>

                    <div id="cashInterStatsDiv" class="tab-pane">
                        <div class="listTable">
                            <form id="cashInterStatsForm">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <th class="r" width="12%">查询时间段：</th>
                                        <td>
                                            <input id="cashInterStats_startDate" class="inputW160"
                                                   onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                                            -
                                            <input id="cashInterStats_endDate" class="inputW160"
                                                   onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                                        </td>
                                        <th class="r" width="12%">交易类型：</th>
                                        <td>
                                            <select id="cashInterStats_tradeType" style="width:140px">
                                                <option value="-1">请选择交易类型</option>
                                                <option value="5">调出</option>
                                                <option value="6">调入</option>
                                            </select>
                                        </td>
                                        <th class="r n_b_b">
                                            <a href="javascript:void(0)" onclick="cashInterStatsReloadGrid();"
                                               class="fm-button ui-state-default ui-corner-all fm-button-icon-right ui-reset btn btn-sm btn-success"><span
                                                    class="icon-search"></span>查 询</a>
                                            <a href="javascript:void(0)"
                                               onclick="com.ai.bdx.util.reset('cashInterStatsForm');"
                                               class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-search btn btn-sm btn-gray"><span
                                                    class="icon-retweet"></span>重 置</a>
                                        </th>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div>
                            <table id="cashInterStats" width="100%" border="0" cellspacing="0" cellpadding="0">
                            </table>
                            <div id="cashInterStats_pager"></div>
                        </div>
                    </div>

                    <div id="prettyCashStatsDiv" class="tab-pane">
                        <div class="listTable">
                            <form id="prettyCashStatsForm">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <th class="r" width="12%">查询时间段：</th>
                                        <td width="40%">
                                            <input id="prettyCashStats_startDate" class="inputW160"
                                                   onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                                            -
                                            <input id="prettyCashStats_endDate" class="inputW160"
                                                   onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                                        </td>
                                        <th class="r n_b_b">
                                            <a href="javascript:void(0)" onclick="prettyCashStatsReloadGrid();"
                                               class="fm-button ui-state-default ui-corner-all fm-button-icon-right ui-reset btn btn-sm btn-success"><span
                                                    class="icon-search"></span>查 询</a>
                                            <a href="javascript:void(0)"
                                               onclick="com.ai.bdx.util.reset('prettyCashStatsForm');"
                                               class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-search btn btn-sm btn-gray"><span
                                                    class="icon-retweet"></span>重 置</a>
                                        </th>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div>
                            <table id="prettyCashStats" width="100%" border="0" cellspacing="0" cellpadding="0">
                            </table>
                            <div id="prettyCashStats_pager"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
