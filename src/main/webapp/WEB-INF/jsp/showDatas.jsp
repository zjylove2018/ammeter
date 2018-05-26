<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/18 0018
  Time: 上午 11:00
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

    <script type="text/javascript">
        $(function(){
            $("#cleanNewDatas").click(function(){
                $.messager
                    .confirm('系统提示','您确定要删除本条记录吗?',function(isConfirm) {
                        if (isConfirm) {
                            location.href = '/ammeter/deleteNewDatas?id=${dataInfo.id }';
                        }
                    });
            });
        })
    </script>

</head>
<body class="easyui-layout">
<div data-options="region:'north',border:false" style="height:60px; width: 300px ; background:#B3DFDA;padding:10px">
    <!-- 显示天气预报-->
    <iframe width="380" scrolling="no" height="25" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=34&icon=1&num=3"></iframe>
    <!-- 北京时间-->
    <div id="showTime"></div>

</div>
<div data-options="region:'west',split:true,title:'主菜单'" style="width:200px;">
    <div class="easyui-accordion" data-options="fit:true">
        <div title="功能菜单" style="height: 30px">
            <!-- 展示菜单数据等 -->
            <ul>
                <li>
                    <form method="post" enctype="multipart/form-data" id="form" action="/ammeter/ammeterInfo_importXls">
                        <input type="file" name="file"/>
                        <input type="submit" value="上传数据excl"/>
                    </form>
                </li>
                <li>
                    <input type="button" value="添加数据" onclick="window.location.href='/ammeter/addDatas'"/>
                </li>
                <li>
                    <input type="button" value="修改数据" onclick="window.location.href='/ammeter/updateDatas'"/>
                </li>
                <li>
                    <input id="cleanNewDatas" type="button" value="删除数据" />
                    <%--<a class="pn-opt" name="id" onclick="if(!confirm('您确定删除吗？确定就真没了!!!')) {return false;}" href="/ammeter/deleteNewDatas?id=${dataInfo.id }">删除数据</a>--%>
                </li>
                <li>
                    <input type="button" value="所有数据" onclick="window.location.href='/ammeter/showAllDatas'"/>
                </li>
                <li>
                    <form method="post" enctype="multipart/form-data" id="form2" action="/ammeter/User_importXls">
                        <input type="file" name="file"/>
                        <input type="submit" value="用户数据上传"/>
                    </form>
                </li>
                <li>
                    <input type="button" value="刷新网页" onclick="javascript: location.reload(true);" />
                </li>
            </ul>

        </div>
        <div title="系统管理">
            <ul>
                <li>
                    <!-- 修改密码操作 -->
                    <input type="button" value="修改密码" id="chargePassWord">
                </li>
                <li>
                    <!-- 退出登录操作 -->
                    <input type="button" value="退出登录" id="loginOut">
                </li>
            </ul>
            <!--修改密码-->
            <script type="text/javascript">
                $(function(){
                    $("#chargePassWord").click(function(){
                        $('#editPwdWindow').window('open');
                    });
                })
            </script>
            <!--退出登录-->
            <script type="text/javascript">
                $(function(){
                    $("#loginOut").click(function(){
                        $.messager
                            .confirm('系统提示','您确定要退出本次登录吗?',function(isConfirm) {
                                if (isConfirm) {
                                    location.href = '../../index.html';
                                }
                            });
                    });
                })
            </script>
        </div>
    </div>
</div>
<!--中部区域 -->
<div id="shuju" data-options="region:'center',title:'数据显示区'">
    <!-- 展示折叠面板 fit:自适应填充父容器-->
    <div id="myTabs" class="easyui-tabs" data-options="fit:true">
        <div id="zheshisha" title="最近的数据" data-options="iconCls:'icon-save'">
            <!-- 电表数据展示主页面-->
            <table id="ameeterId" class="table-edit" width="80%" align="center">
                <tr class="title" style="text-align: center">
                    <td colspan="8" style="color: darkblue"><font size="6">最近添加的表数据详情</font>
                        <!--提供隐藏域 装载id -->
                        <input type="hidden" name="id" />
                    </td>
                </tr>
                <tr>
                    <td rowspan="10" >
                        <input type="image" src="img/login.jpg" width="300px" height="360px"/>
                    </td>
                    <td colspan="2">
                        <font color="#006400">数据ID号</font>:<span>${dataInfo.info_id }</span>
                    </td>
                    <td colspan="2">
                        <font color="#006400">缴费人员</font>:<span>${dataInfo.worker }</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <font color="#006400">更新日期</font>:<span>${dataInfo.modifier_date }</span>
                    </td>
                    <td colspan="2">
                        <font color="#006400">项目编号</font>:<span>${dataInfo.item_num }</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <font color="#006400">电表数量</font>:<span>${dataInfo.ammeter_num }</span>
                    </td>
                    <td colspan="2">
                        <font color="#006400">缴费次数</font>:<span>${dataInfo.payment_total }</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <font color="#006400">移动结算</font>:<span>${dataInfo.isAccount }</span>
                    </td>
                    <td colspan="2">
                        <font color="#006400">基站站名</font>:<span>${dataInfo.machine_room }</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <font color="#006400">所属机房</font>:<span>${dataInfo.machine_room }</span>
                    </td>
                    <td colspan="2">
                         <font color="red">预交日期</font>:<span>${dataInfo.befor_payment_date }</span>
                    </td>
                </tr>
                   <tr>
                       <td colspan="2">
                           <font color="#006400">上期电量</font>:<span>${dataInfo.last_ammeter_num }</span>
                       </td>
                       <td colspan="2">
                           <font color="#006400">本期电量</font>:<span>${dataInfo.now_ammeter_num }</span>
                       </td>
                   </tr>
                   <tr>
                       <td colspan="2">
                           <font color="#006400">上期查表</font>:<span>${dataInfo.last_check_ammeter }</span>
                       </td>
                       <td colspan="2">
                           <font color="#006400">本期查表</font>: <span>${dataInfo.now_check_ammeter }</span>
                       </td>
                   </tr>
                   <tr>
                       <td colspan="2">
                             <font color="red">基础倍率</font>:<span>${dataInfo.multiple }</span>
                       </td>
                       <td colspan="2">
                             <font color="red">抄表单价</font>:<span>${dataInfo.form_price }</span>
                       </td>
                   </tr>
                   <tr>
                       <td colspan="2">
                            <font color="red">财务支出</font>: <span>${dataInfo.finance_expend_money }</span>
                       </td>
                       <td colspan="2">
                           <font color="red">移动结算</font>:<span>${dataInfo.move_account_money }</span>
                       </td>
                   </tr>
                   <tr>
                       <td colspan="2">
                           <font color="#006400">回款次数</font>:<span>${dataInfo.returned_money_count }</span>
                       </td>
                       <td colspan="2">
                            <font color="red">毛利国税</font>:<span>${dataInfo.gross_margin }</span>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           <font color="#006400">表识别号</font>:<span>${dataInfo.info_id }</span>
                       </td>
                       <td colspan="2">
                           <font color="#006400">出租单位</font>: <span>${dataInfo.rent_company }</span>
                       </td>
                       <td colspan="2">
                           <font color="red">报移动电</font>:<span>${dataInfo.finance_expend_money }</span>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           <font color="#006400">甲方人员</font>:<span>${dataInfo.linkman }</span>
                       </td>
                       <td colspan="2">
                           <font color="#006400">收款单位</font>:<span>${dataInfo.gathering_company}</span>
                       </td>
                       <td colspan="2">
                           <font color="#006400">联系方式</font>:<span>${dataInfo.phone }</span>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           <font color="#006400">电表地址</font>:<span>${dataInfo.ammeter_address }</span>
                       </td>
                       <td colspan="2">
                           <font color="#006400">电表类型</font>:<span>${dataInfo.ammeter_type }</span>
                       </td>
                       <td colspan="2">
                           <font color="#006400">详情备注</font>:<span>${dataInfo.remark }</span>
                       </td>
                   </tr>
            </table>
        </div>
    </div>
</div>

<!--修改密码窗口-->
<div id="editPwdWindow" class="easyui-window" title="修改密码" collapsible="false" minimizable="false" modal="true" closed="true" resizable="false" maximizable="false" icon="icon-save" style="width: 300px; height: 200px; padding: 5px;
        background: #fafafa">
    <div class="easyui-layout" fit="true">
        <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
            <table cellpadding=3>
                <tr>
                    <td>原始密码：</td>
                    <td>
                        <input id="txtOldPass" type="Password" class="txt01" />
                    </td>
                </tr>
                <tr>
                    <td>新密码：</td>
                    <td>
                        <input id="txtNewPass" type="Password" class="txt01" />
                    </td>
                </tr>
                <tr>
                    <td>确认密码：</td>
                    <td>
                        <input id="txtRePass" type="Password" class="txt01" />
                    </td>
                </tr>
            </table>
        </div>
        <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
            <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">确定</a>
            <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
        </div>
    </div>
</div>

</body>
</html>
