<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/22 0022
  Time: 下午 2:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>显示所有数据界面</title>
    <link rel="stylesheet" type="text/css" href="../../themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../../plugins/bootstrap.min.css">
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.js"></script>
    <script type="text/javascript" src="../../js/showDatas.js"></script>

    <script type="text/javascript">
        function checkBox(name,checked){
            /* 全选,全不选 */
            $("input[name="+name+"]").attr("checked",checked);
        }

        /* 批量删除 ,物理删除*/
        function optDelete(name,isDisplay,pageNo){
            var size=$("input[name=ids]:checked").size();
            if(size==0){
                alert("提示信息","至少选择一个进行操作",waring);
                return;
            }
            if(!confirm("你确定删除吗?")){
                return;
            }
            $("#jvForm").attr("action","/brand/deletes.do?name="+name+"&isDisplay="+isDisplay+"&pageNo="+pageNo);
            $("#jvForm").attr("method","post").submit();
        }

        /*批量还原*/
        function deleteShow(name,isDisplay,pageNo){
            var size=$("input[name=ids]:checked").size();
            if(size==0){
                alert("提示信息","至少选择一个进行操作",waring);
                return;
            }
            if(!confirm("你确定还原吗?")){
                return;
            }
            $("#jvForm").attr("action","/brand/deletesShow.do?name="+name+"&isDisplay="+isDisplay+"&pageNo="+pageNo);
            $("#jvForm").attr("method","post").submit();
        }
    </script>
</head>
<body class="easyui-layout">
<div data-options="region:'west',split:true,title:'主菜单'" style="width:200px;">
    <div class="easyui-accordion" data-options="fit:true">
        <div title="功能菜单" style="height: 30px">
            <!-- 展示菜单数据等 -->
            <ul>
                <li>
                    <input type="button" value="修改数据" onclick="window.location.href='/ammeter/updateDatas'"/>
                </li>
                <li>
                    <input type="button" value="所有数据" onclick="window.location.href='/ammeter/showAllDatas'"/>
                </li>
                <li>
                    <input type="button" value="刷新网页" onclick="javascript: location.reload(true);" />
                </li>
            </ul>
        </div>
    </div>
</div>
<!--中部区域 -->
<div id="shuju" data-options="region:'center',title:'数据显示区'">


    <nav class="navbar navbar-default" role="navigation" style="height: 10px">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Brand</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Link</a></li>
                <li><a href="#">Link</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        <li class="divider"></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="输入要搜索的内容">
                </div>
                <button type="submit" class="btn btn-default">查询</button>
            </form>
        </div>
    </nav>

    <!-- 展示折叠面板 fit:自适应填充父容器-->
    <div id="myTabs" class="easyui-tabs" data-options="fit:true">
        <div id="zheshisha" title="展示所有数据" data-options="iconCls:'icon-save'">
            <!-- 电表数据展示主页面-->
            <form id="jvForm">
                <table id="ameeterId" class="table-edit" width="80%" align="center">
                    <tr class="title" style="text-align: center">
                        <!--提供隐藏域 装载id -->
                        <input type="hidden" name="id" />
                    </tr>
                    <thead class="pn-lthead">
                    <tr>
                        <th width="20"><input type="checkbox" onclick="checkBox('ids',this.checked)"/></th>
                        <th>预交日期</th>
                        <th>报移动电</th>
                        <th>基础倍率</th>
                        <th>抄表单价</th>
                        <th>财务支出</th>
                        <th>移动结账</th>
                        <th>毛利国税</th>
                        <th>操作选项</th>
                    </tr>
                    </thead>
                    <tbody class="pn-ltbody">
                    <c:forEach items="${dataInfoList }" var="brand">
                        <tr bgcolor="#ffffff" onmouseout="this.bgColor='#ffffff'" onmouseover="this.bgColor='#eeeeee'">
                            <td><input type="checkbox" value="${brand.id }" name="ids"/></td>
                            <td align="center">${brand.befor_payment_date } </td>
                            <td align="center">${brand.reality_report_num } </td>
                            <%--<td align="center"><img width="40" height="40" src="${brand.imgUrl }"/></td>--%>
                            <td align="center">${brand.multiple } </td>
                            <td align="center">${brand.form_price } </td>
                            <%--<td align="center">
                                <c:if test="${brand.isDisplay == true }">是</c:if>
                                <c:if test="${brand.isDisplay == false }">否</c:if>
                            </td>--%>
                            <td align="center">${brand.finance_expend_money } </td>
                            <td align="center">${brand.move_account_money } </td>
                            <td align="center">${brand.gross_margin } </td>
                            <td align="center">
                                <a class="pn-opt" href="/brand/toEdit.do?id=${brand.id }">更多..</a> | <a class="pn-opt" href="/brand/toEdit.do?id=${brand.id }">修改</a> | <a class="pn-opt" onclick="if(!confirm('您确定删除吗？')) {return false;}" href="/brand/deleteBrandById.do?id=${brand.id }">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="10">
                            <%--分页组件--%>
                            <ul class="pagination" style="top: 10px">
                                <li><a href="#">&laquo;</a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">&raquo;</a></li>
                            </ul>
                        </td>
                    </tr>
                    </tbody>
                    <%--<tr>
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
                                <font color="#006400">电表表数</font>:<span>${dataInfo.ammeter_num }</span>
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
                                <font color="#006400">上期表数</font>:<span>${dataInfo.last_ammeter_num }</span>
                            </td>
                            <td colspan="2">
                                <font color="#006400">本期表数</font>:<span>${dataInfo.now_ammeter_num }</span>
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
                                <font color="red">报移动电</font>:<span>${dataInfo.ammeter_discern_num }</span>
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
                        </tr>--%>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>
