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
    <title>主功能界面</title>
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
        <div id="zheshisha" title="最近的数据" data-options="iconCls:'icon-save'">
            <!-- 电表数据展示主页面-->
            <table id="ameeterId" class="table-edit" width="80%" align="center">
                <tr class="title" style="text-align: center">
                    <td colspan="8" style="color: darkblue"><font size="6">添加新的表数据</font>
                        <!--提供隐藏域 装载id -->
                        <input type="hidden" name="id" />
                    </td>
                </tr>
                <tr >
                    <td style="align-content: center">
                        <font size="3" color="orange">电表图片</font>
                    </td>
                    <td style="align-content: center">
                        <font size="3" color="orange">其他信息</font>
                    </td>
                </tr>
                <tr>
                    <td rowspan="10" >
                        <input type="file" onchange="uploadPic()" name="pics" multiple="multiple" width="300px" height="360px"/>
                    </td>
                    <td colspan="2">
                        <font color="#006400">数据ID号</font>:<input type="text" name="minWeight" class="easyui-numberbox" style="width: 150px" />
                    </td>
                    <td colspan="2">
                        <font color="#006400">缴费人员</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <font color="#006400">更新日期</font>:<input id="dd" type="date" class="easyui-datebox" style="width: 150px" >
                    </td>
                    <td colspan="2">
                        <font color="#006400">项目编号</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <font color="#006400">电表表数</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                    <td colspan="2">
                        <font color="#006400">缴费次数</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <font color="#006400">移动结算</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                    <td colspan="2">
                        <font color="#006400">基站站名</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <font color="#006400">所属机房</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                    <td colspan="2">
                        <font color="red">预交日期</font>:<input type="date" class="easyui-datebox" style="width: 150px" >
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <font color="#006400">上期表数</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                    <td colspan="2">
                        <font color="#006400">本期表数</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <font color="#006400">上期查表</font>:<input type="date" class="easyui-datebox" style="width: 150px" >
                    </td>
                    <td colspan="2">
                        <font color="#006400">现查表日</font>:<input type="date" class="easyui-datebox" style="width: 150px" >
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <font color="red">基础倍率</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                    <td colspan="2">
                        <font color="red">抄表单价</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <font color="red">财务支出</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                    <td colspan="2">
                        <font color="red">移动结算</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <font color="#006400">回款次数</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                    <td colspan="2">
                        <font color="red">毛利国税</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <font color="#006400">表识别号</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                    <td colspan="2">
                        <font color="#006400">出租单位</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                    <td colspan="2">
                        <font color="red">报移动电</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <font color="#006400">甲方人员</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                    <td colspan="2">
                        <font color="#006400">收款单位</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                    <td colspan="2">
                        <font color="#006400">联系方式</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <font color="#006400">电表地址</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                    <td colspan="2">
                        <font color="#006400">电表类型</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                    <td colspan="2">
                        <font color="#006400">详情备注</font>:<input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                </tr>
            </table>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">确定</a>
                <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
