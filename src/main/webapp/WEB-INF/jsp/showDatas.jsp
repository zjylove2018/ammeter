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
    <link rel="stylesheet" type="text/css" href="demo.css">
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../locale/easyui-lang-zh_CH.js"></script>
    <script type="text/javascript" src="../../js/showDatas.js"></script>

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
                    <input type="button" value="添加数据" id="addAmmeterInfo"/>
                </li>
                <li>
                    <input type="button" value="修改数据" id="updateAmmeterInfo"/>
                </li>
                <li>
                    <%--<input type="button" value="修改数据" id="updateAmmeterInfo"/>--%>
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

            <!--添加数据-->
            <script type="text/javascript">
                $(function(){
                    $("#addAmmeterInfo").click(function(){
                        $('#addAndUpdateInfoWindow').window('open');
                    });
                })
            </script>
            <!--修改数据-->
            <script type="text/javascript">
                $(function(){
                    $("#updateAmmeterInfo").click(function(){
                        $('#addAndUpdateInfoWindow').window('open');
                    });
                })
            </script>

            <%--页面加载完成后,默认显示数据库最后存进的一条数据--%>
            <script>
                $(function(){
                    $.ajax({
                        url : '/ammeter/showNewInfo',
                        type : 'POST',
                        dataType : 'json',
                        success : function(data) {

                        },
                        error : function(msg) {
                            alert('页面加载时显示数据异常!!!');
                        }
                    });
                 });
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

               <%-- 数据添加页面--%>

                <tr class="title" style="text-align: center">
                    <td colspan="4" style="color: darkblue"><font size="6">最近添加的表数据详情</font>
                        <!--提供隐藏域 装载id -->
                        <input type="hidden" name="id" />
                    </td>
                </tr>
                <tr >
                    <td style="align-content: center">
                        <font size="3" color="orange">电表图片</font>
                    </td>
                    <td colspan="2">
                        <font size="3" color="orange">其他数据</font>
                    </td>
                </tr>
                <tr>
                    <td rowspan="11">
                        <input type="image" src="img/login.jpg" width="350px" height="400px"/>
                    </td>
                    <td>
                        ID号
                    </td>
                    <td>
                        <div class="dd">
                            <span>${product.id }</span>
                        </div>
                    </td>
                    <td>
                        电表识别号
                    </td>
                    <td>
                        <div class="dd">
                            <span>${product.id }</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        缴费员
                    </td>
                    <td >
                        <div class="dd">
                            <span>${product.id }</span>
                        </div>
                    </td>
                    <td>
                        电表位置
                    </td>
                    <td colspan="2">
                        <div class="dd">
                            <span>${product.id }</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        更新日期
                    </td>
                    <td >
                        <div class="dd">
                            <span>${product.id }</span>
                        </div>
                    </td>
                    <td>
                        甲方联系人
                    </td>
                    <td >
                        <div class="dd">
                            <span>${product.id }</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        上期表数
                    </td>
                    <td >
                        <div class="dd">
                            <span>${product.id }</span>
                        </div>
                    </td>
                    <td>
                        本期表数
                    </td>
                    <td >
                        <div class="dd">
                            <span>${product.id }</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <font color="red">报移动用电量</font>
                    </td>
                    <td >
                        <div class="dd">
                            <span>${product.id }</span>
                        </div>
                    </td>
                    <td>
                        <font color="red">财务支出金额</font>
                    </td>
                    <td >
                        <div class="dd">
                            <span>${product.id }</span>
                        </div>
                    </td>
                </tr>
                   <tr>
                       <td>
                           <font color="red">移动结算金额</font>
                       </td>
                       <td >
                           <div class="dd">
                               <span>${product.id }</span>
                           </div>
                       </td>
                       <td>
                           <font color="red">毛利（国税)</font>
                       </td>
                       <td >
                           <div class="dd">
                               <span>${product.id }</span>
                           </div>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           <font color="red">倍率</font>
                       </td>
                       <td >
                           <div class="dd">
                               <span>${product.id }</span>
                           </div>
                       </td>
                       <td>
                           <font color="red">抄表单单价</font>
                       </td>
                       <td >
                           <div class="dd">
                               <span>${product.id }</span>
                           </div>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           <font color="red">预交费日期</font>
                       </td>
                       <td >
                           <div class="dd">
                               <span>${product.id }</span>
                           </div>
                       </td>
                       <td>
                           出租单位名称
                       </td>
                       <td >
                           <div class="dd">
                               <span>${product.id }</span>
                           </div>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           电表数
                       </td>
                       <td >
                           <div class="dd">
                               <span>bbbbbbb</span>
                           </div>
                       </td>
                       <td>
                           缴费次数
                       </td>
                       <td >
                           <div class="dd">
                               <span>aaaaa</span>
                           </div>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           站名
                       </td>
                       <td >
                           <div class="dd">
                               <span>aaaaa</span>
                           </div>
                       </td>
                       <td>
                           所属机房
                       </td>
                       <td >
                           <div class="dd">
                               <span>aaaa</span>
                           </div>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           支票号
                       </td>
                       <td >
                           <input type="text" name="maxLength" class="easyui-numberbox" style="width: 150px" />
                       </td>
                       <td>
                           回款次数
                       </td>
                       <td >
                           <input type="text" name="maxLength" class="easyui-numberbox" style="width: 150px"/>
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

<!--添加和修改数据窗口-->
<div id="addAndUpdateInfoWindow" class="easyui-window" title="新数据添加" collapsible="false" minimizable="false" modal="true" closed="true" resizable="false" maximizable="false" icon="icon-save" style="width: 1200px; height: 600px; padding: 5px;
        background: #fafafa">
    <div class="easyui-layout" fit="true">
        <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
            <table id="addAndUpdateAmeeterId" class="table-edit" width="80%" align="center" >

                <%-- 数据添加页面--%>

                <tr class="title" style="text-align: center">
                    <td colspan="4" style="color: darkblue"><font size="6">添加一条新数据</font>
                        <!--提供隐藏域 装载id -->
                        <input type="hidden" name="id" />
                    </td>
                </tr>
                <tr >
                    <td style="align-content: center">
                        <font size="3" color="orange">电表图片</font>
                    </td>
                    <td colspan="2">
                        <font size="3" color="orange">其他数据</font>
                    </td>
                </tr>
                <tr>
                    <td rowspan="11">
                        <input type="image" src="img/login.jpg" width="350px" height="400px"/>
                    </td>
                    <td>
                        ID号
                    </td>
                    <td>
                        <input type="text" name="minWeight" class="easyui-numberbox" style="width: 150px" />
                    </td>
                    <td>
                        电表识别号
                    </td>
                    <td>
                        <input type="text" name="minWeight" class="easyui-numberbox" style="width: 150px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        缴费员
                    </td>
                    <td >
                        <input type="text" name="maxWeight" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                    <td>
                        电表位置
                    </td>
                    <td colspan="2">
                        <input type="text" name="maxWeight" class="easyui-numberbox" style="width: 150px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        更新日期
                    </td>
                    <td >
                        <input type="text" name="minLength" class="easyui-numberbox" style="width: 150px" />
                    </td>
                    <td>
                        甲方联系人
                    </td>
                    <td >
                        <input type="text" name="minLength" class="easyui-numberbox" style="width: 150px"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        上期表数
                    </td>
                    <td >
                        <input type="text" name="maxLength" class="easyui-numberbox" style="width: 150px" />
                    </td>
                    <td>
                        本期表数
                    </td>
                    <td >
                        <input type="text" name="maxLength" class="easyui-numberbox" style="width: 150px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <font color="red">报移动用电量</font>
                    </td>
                    <td >
                        <input type="text" name="maxLength" class="easyui-numberbox" style="width: 150px" />
                    </td>
                    <td>
                        <font color="red">财务支出金额</font>
                    </td>
                    <td >
                        <input type="text" name="maxLength" class="easyui-numberbox" style="width: 150px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <font color="red">移动结算金额</font>
                    </td>
                    <td >
                        <input type="text" name="maxLength" class="easyui-numberbox" style="width: 150px" />
                    </td>
                    <td>
                        <font color="red">毛利（国税)</font>
                    </td>
                    <td >
                        <input type="text" name="maxLength" class="easyui-numberbox" style="width: 150px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <font color="red">倍率</font>
                    </td>
                    <td >
                        <input type="text" name="maxLength" class="easyui-numberbox"  style="width: 150px"/>
                    </td>
                    <td>
                        <font color="red">抄表单单价</font>
                    </td>
                    <td >
                        <input type="text" name="maxLength" class="easyui-numberbox" style="width: 150px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <font color="red">预交费日期</font>
                    </td>
                    <td >
                        <input type="text" name="maxLength" class="easyui-numberbox" style="width: 150px" />
                    </td>
                    <td>
                        出租单位名称
                    </td>
                    <td >
                        <input type="text" name="maxLength" class="easyui-numberbox" style="width: 150px"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        电表数
                    </td>
                    <td >
                        <input type="text" name="maxLength" class="easyui-numberbox" style="width: 150px" />
                    </td>
                    <td>
                        缴费次数
                    </td>
                    <td >
                        <input type="text" name="maxLength" class="easyui-numberbox" style="width: 150px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        站名
                    </td>
                    <td >
                        <input type="text" name="maxLength" class="easyui-numberbox" style="width: 150px" />
                    </td>
                    <td>
                        所属机房
                    </td>
                    <td >
                        <input type="text" name="maxLength" class="easyui-numberbox" style="width: 150px"/>
                    </td>
                </tr>
                    <tr>
                        <td>
                            支票号
                        </td>
                        <td >
                            <input type="text" name="maxLength" class="easyui-numberbox" style="width: 150px" />
                        </td>
                        <td>
                            回款次数
                        </td>
                        <td >
                            <input type="text" name="maxLength" class="easyui-numberbox" style="width: 150px"/>
                        </td>
                    </tr>
            </table>
        </div>
        <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
            <a id="btnSure" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">确定</a>
            <a id="btnUnSure" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
        </div>
    </div>
</div>
</body>
</html>
