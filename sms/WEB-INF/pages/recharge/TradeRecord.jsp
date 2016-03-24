<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
    <title>交易记录查询</title>
    <link href="${ctx}/sms/statics/common/css/css.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${ctx}/sms/statics/ace/plugins/select2-3.4.1/select2.css" type="text/css"/>
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/date/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/recharge/TradeRecord.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/jquery.page.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/select2-3.4.1/select2.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/jquery.jqGrid.min.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/grid.locale-cn.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        a {
            text-decoration: none;
        }

        a:hover {
            text-decoration: none;
        }

        .tcdPageCode {
            padding: 15px 20px;
            text-align: left;
            color: #ccc;
            text-align: center;
        }

        .tcdPageCode a {
            display: inline-block;
            color: #428bca;
            display: inline-block;
            height: 25px;
            line-height: 25px;
            padding: 0 10px;
            border: 1px solid #ddd;
            margin: 0 2px;
            border-radius: 4px;
            vertical-align: middle;
        }

        .tcdPageCode a:hover {
            text-decoration: none;
            border: 1px solid #428bca;
        }

        .tcdPageCode span.current {
            display: inline-block;
            height: 25px;
            line-height: 25px;
            padding: 0 10px;
            margin: 0 2px;
            color: #fff;
            background-color: #428bca;
            border: 1px solid #428bca;
            border-radius: 4px;
            vertical-align: middle;
        }

        .tcdPageCode span.disabled {
            display: inline-block;
            height: 25px;
            line-height: 25px;
            padding: 0 10px;
            margin: 0 2px;
            color: #bfbfbf;
            background: #f2f2f2;
            border: 1px solid #bfbfbf;
            border-radius: 4px;
            vertical-align: middle;
        }
    </style>
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
            交易记录
        </li>
        <li class="active">交易记录</li>
    </ul>
    <!-- .breadcrumb -->
</div>
<div class="wrap100 quickrecharge">
    <div class="q_r_list">

        <!--交易记录查询条件 begin-->
        <div class="listTable">
            <form id="searchForm" action="#">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <th width="13%" class="r">卡号：</th>
                        <td width="18%">
                            <input id="cardNo" name="cardNo" class="inputW150"/>
                        </td>
                        <th class="r">持卡人姓名 ：</th>
                        <td><input id="name" name="name" class="inputW150"/></td>

                        <th class="r">卡类型 ：</th>
                        <td><label></label>
                            <select name="cardType" id="cardType" style="width:120px">
                                <option value="-1">请选择卡类型</option>
                            </select></td>
                    </tr>
                    <tr>
                        <th class="r">交易类型 ：</th>
                        <td><select name="transactionType" id="transactionType" style="width:140px">
                            <option value="-1">请选择交易类型</option>
                        </select></td>
                        <th class="r">交易日期 ：</th>
                        <td colspan="3">
                            <input id="dateStart" name="dateStart" class="inputW120"
                                   onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                            -
                            <input id="dateEnd" name="dateEnd" class="inputW120"
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
                        <a href="javascript:void(0)" onclick="ReadCard()" id="fbox_grid-table_search"
                           class="fm-button ui-state-default ui-corner-all fm-button-icon-right ui-reset btn btn-sm btn-primary"><span
                                class="icon-credit-card"></span>读 卡</a>
                        <a href="javascript:void(0)" onclick="reloadGrid();"
                           class="fm-button ui-state-default ui-corner-all fm-button-icon-right ui-reset btn btn-sm btn-success"><span
                                class="icon-search"></span>查 询</a>
                        <a href="javascript:void(0)" onclick="com.ai.bdx.util.reset('searchForm');"
                           class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-search btn btn-sm btn-gray"><span
                                class="icon-retweet"></span>重 置</a>
                </tr>
            </table>
        </div>
        <!--交易记录查询条件 end-->

        <!--交易记录查询列表 begin-->
        <div>
            <table id="divJyjl" width="100%" border="0" cellspacing="0" cellpadding="0">

            </table>
            <div id="divPage"></div>
        </div>
    </div>


</div>

</body>
</html>
