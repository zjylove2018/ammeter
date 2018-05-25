<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/21 0021
  Time: 下午 4:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加功能界面</title>
    <link rel="stylesheet" type="text/css" href="../../themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../themes/icon.css">
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../js/showDatas.js"></script>
    <script type="text/javascript" src="../../plugins/jquery.datebox.js"></script>

    <!--${pageContext.request.contextPath}-->
    <!--显示时间 -->
    <script>
        function mytime(){
            var a = new Date();
            var b = a.toLocaleTimeString();
            var c = a.toLocaleDateString();
            document.getElementById("showTime").innerHTML = c+"&nbsp"+b;
        }
        setInterval(function() {mytime()},1000);

        $(function() {
            // 先将addAndEditAmeter表单隐藏，再显示，不会出现页面刷新效果
            $("#addAndEditAmeter").window('close');
        });
    </script>

    <%--添加新数据-图片添加--%>
    <script>
        function uploadPic(){
            //上传图片 异步的  	Jquery.form.js
            var options = {
                url : "/upload/uploadPics.do",
                type : "post",
                dataType : "json",
                success : function(data){
                    //多图片回显
                    var html = '<tr>'
                        + '<td width="20%" class="pn-flabel pn-flabel-h"></td>'
                        + '<td width="80%" class="pn-fcontent">';
                    for(var i=0;i<data.length;i++){
                        html += '<img width="100" height="100" src="' + data[i] + '" />'
                            +  '<input type="hidden" name="imgUrl" value="' + data[i] + '"/>'
                    }
                    html += '<a href="javascript:;" class="pn-opt" onclick="jQuery(this).parents(\'tr\').remove()">删除</a>'
                        +  '</td>'
                        +  '</tr>';
                    //回显
                    $("#tab_2").append(html);

                }
            }
            $("#jvForm").ajaxSubmit(options);
        }
    </script>

</head>
<body class="easyui-layout">
<div data-options="region:'north',border:false" style="height:60px; width: 300px ; background:#B3DFDA;padding:10px">
    <!-- 显示天气预报-->
    <iframe width="380" scrolling="no" height="25" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=34&icon=1&num=3"></iframe>
    <!-- 北京时间-->
    <div id="showTime"></div>

</div>
<!--中部区域 -->
<div id="shuju" data-options="region:'center',title:'数据显示区'">
    <!-- 展示折叠面板 fit:自适应填充父容器-->
    <div id="myTabs" class="easyui-tabs" data-options="fit:true">
        <div id="zheshisha" title="添加新数据" data-options="iconCls:'icon-save'">
            <!-- 电表数据展示主页面-->
            <form id="jvForm" action="/ammeter/addAmmeterInfo" method="post" >
                <table id="ameeterId" class="table-edit" width="80%" align="center">
                    <tr class="title" style="text-align: center">
                        <td colspan="8" style="color: darkblue"><font size="6">添加新的表数据</font>
                            <!--提供隐藏域 装载id -->
                            <input type="hidden" name="id" />
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="10" >
                            <%--<input type="file" onchange="uploadPic()" name="pics" multiple="multiple" width="300px" height="360px"/>--%>
                        </td>
                        <td colspan="2">
                            <font color="#006400"><b>数据ID号</b></font>:<input type="text" name="info_id" class="easyui-textbox" style="width: 200px" />
                        </td>
                        <td colspan="2">
                            <font color="#006400"><b>缴费人员</b></font>:<input type="text" name="worker" class="easyui-textbox" style="width: 200px"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <font color="#006400"><b>更新日期</b></font>:<input id="dd" type="text" name="modifier_date" class="easyui-datebox" style="width: 200px">
                        </td>
                        <td colspan="2">
                            <font color="#006400"><b>项目编号</b></font>:<input type="text" name="item_num" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <font color="#006400"><b>电表数量</b></font>:<input type="text" name="ammeter_num" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                        <td colspan="2">
                            <font color="#006400"><b>缴费次数</b></font>:<input type="text" name="payment_total" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <font color="#006400"><b>移动结算</b></font>:<input type="text" name="move_account_money" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                        <td colspan="2">
                            <font color="#006400"><b>基站站名</b></font>:<input type="text" name="station_name" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <font color="#006400"><b>所属机房</b></font>:<input type="text" name="machine_room" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                        <td colspan="2">
                            <font color="red"><b>预交日期</b></font>:<input type="text" name="befor_payment_date" class="easyui-datebox" style="width: 200px" >
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <font color="#006400"><b>上期电量</b></font>:<input type="text" name="last_ammeter_num" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                        <td colspan="2">
                            <font color="#006400"><b>本期电量</b></font>:<input type="text" name="now_ammeter_num" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <font color="#006400"><b>上期查表</b></font>:<input type="text" name="last_check_ammeter" class="easyui-datebox" style="width: 200px" >
                        </td>
                        <td colspan="2">
                            <font color="#006400"><b>现查表日</b></font>:<input type="text" name="now_check_ammeter" class="easyui-datebox" style="width: 200px" >
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <font color="red"><b>基础倍率</b></font>:<input type="text" name="multiple" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                        <td colspan="2">
                            <font color="red"><b>抄表单价</b></font>:<input type="text" name="form_price" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <font color="red"><b>财务支出</b></font>:<input type="text" name="finance_expend_money" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                        <td colspan="2">
                            <font color="red"><b>移动结算</b></font>:<input type="text" name="move_account_money" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <font color="#006400"><b>回款次数</b></font>:<input type="text" name="returned_money_count" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                        <td colspan="2">
                            <font color="red"><b>毛利国税</b></font>:<input type="text" name="gross_margin" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <font color="#006400"><b>表识别号</b></font>:<input type="text" name="ammeter_discern_num" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                        <td colspan="2">
                            <font color="#006400"><b>出租单位</b></font>:<input type="text" name="rent_company" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                        <td colspan="2">
                            <font color="red"><b>报移动电</b></font>:<input type="text" name="finance_expend_money" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <font color="#006400"><b>甲方人员</b></font>:<input type="text" name="linkman" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                        <td colspan="2">
                            <font color="#006400"><b>收款单位</b></font>:<input type="text" name="gathering_company" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                        <td colspan="2">
                            <font color="#006400"><b>联系方式</b></font>:<input type="text" name="phone" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <font color="#006400"><b>电表地址</b></font>:<input type="text" name="ammeter_address" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                        <td colspan="2">
                            <font color="#006400"><b>电表类型</b></font>:<input type="text" name="ammeter_type" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                        <td colspan="2">
                            <font color="#006400"><b>详情备注</b></font>:<input type="text" name="remark" class="easyui-textbox"  style="width: 200px"/>
                        </td>
                    </tr>
                </table>
                <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                    <input type="submit" class="submit" value="提交"/> &nbsp; &nbsp; &nbsp; &nbsp; <input type="reset" class="reset" value="重置"/>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
