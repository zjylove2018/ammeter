<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/21 0021
  Time: 下午 4:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加和修改界面</title>
    <link rel="stylesheet" type="text/css" href="../../themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../themes/icon.css">
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <script type="text/javascript" src="../../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../../js/showDatas.js"></script>

    <script type="text/javascript">
        //上传图片
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
<body>
    <h2 class="h2_ch">
        <span id="tabs">
            <a href="javascript:void(0);" ref="#tab_2" title="商品图片" <%--class="nor"--%>>商品图片</a>
        </span>
    </h2>
    <!--添加和修改数据页面-->
    <div  class="easyui-window" title="新数据添加" collapsible="false" minimizable="false" modal="true" closed="true" resizable="false" maximizable="false" icon="icon-save" style="width: 1200px; height: 600px; padding: 5px;
            background: #fafafa">
        <form id="jvForm" action="add.do" method="post" enctype="multipart/form-data">
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
                                <input type="file" onchange="uploadPic()" name="pics" multiple="multiple" width="350px" height="400px"/>
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
            </div>
        </form>
    </div>
</body>
</html>
