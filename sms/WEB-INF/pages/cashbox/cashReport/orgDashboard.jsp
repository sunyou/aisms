<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
    <title>我的网点</title>

    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/cashbox/cashReport/orgDashboard.js"></script>

    <link href="${ctx}/sms/statics/common/css/css.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/jquery.easyui.min.js">
    </script>
    <link type="text/css" rel="stylesheet"
          href="${ctx}/sms/statics/common/js/jquery-easyui/themes/default/easyui.css"/>
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
            <a href="/page/orgDashboard">我的网点</a>
        </li>
        <li class="active">我的网点</li>
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
                    <th width="13%" class="r">网点名称：</th>
                    <td width="18%"><strong><label id="orgName"></label></strong></td>
                    <th width="19%" class="r">网点编码：</th>
                    <td width="22%"><strong><label id="orgCode"></label></strong></td>
                </tr>
                <tr>
                    <th class="r" width="13">网点负责人(主管)：</th>
                    <td colspan="3"><label id="orgManagers"></label></td>
                </tr>
                <tr>
                    <th class="r">网点柜员：</th>
                    <td colspan="3"><label id="orgAssistants" /></td>
                </tr>
            </table>
        </div>
        <!--充值 end-->


        <!--卡片基本信息 begin-->
        <h2><span class="active"><i class="r_i_marking">&nbsp;</i>网点今日报表</span></h2>
        <div class="listTable">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <th width="10%" class="r">上日余额(元)：</th>
                    <td width="15%"><label id="lastdaysurplus"></label></td>
                    <th width="16%" class="r">本日收入(元)：</th>
                    <td width="13%"><label id="dayincome"></label></td>
                    <th width="15%" class="r">本日调入(元)：</th>
                    <td width="11%"><label id="daycallin"></label></td>
                </tr>
                <tr>
                    <th class="r">本日支出(元)：</th>
                    <td><label id="dayexpend"></label></td>
                    <th class="r">本日调出(元)：</th>
                    <td><label id="daycalout"></label></td>
                    <th class="r">结存(元)：</th>
                    <td><label id="dayinventory"></label></td>
                </tr>
            </table>
        </div>
        <!--卡片基本信息 end-->
    </div>
</div>
</body>
</html>