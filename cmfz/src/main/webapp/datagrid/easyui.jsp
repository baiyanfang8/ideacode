<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%String path=request.getContextPath();
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBILC"-//W4C/DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Basic Panel - jQuery EasyUI Demo</title>
        <link rel="stylesheet" type="text/css" href=".././themes/default/easyui.css">
        <link rel="stylesheet" type="text/css" href=".././themes/icon.css">
        <script type="text/javascript" src="../js/jquery.min.js"></script>
        <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
        <script type="text/javascript">

        </script>
    </head>
     <body>
        <h2>我是日期Box</h2>
        <p>Multiple datebox components can share a calendar.</p>
     <div style="margin: 20px 0;"></div>
        <table>
            <tr>
                <td>Start Date:</td>
                <td>
                    <input class="easyui-datebox" data-options="sharedCalendar:'#cc'">
                </td>
                <td>End Date:</td>
                <td>
                    <input class="easyui-datebox" data-options="sharedCalendar:'#cc'">
                </td>
                <td>文本框</td>
                <td>
                    <input class="easyui-datebox" type="text"/>
                </td>
                <td>密码</td>
                <td>
                    <input class="easyui-datebox" type="password"/>
                </td>
                <td>普通按钮</td>
                <td>
                    <input type="button"/>
                    <input type="submit"/>
                    <input type="reset"/>
                    <input type="radio"/>
                    <input type="checkbox"/>
                    <input type="image"/>
                    <input type="hidden"/>
                    <input type="file"/>
                </td>
            </tr>
            <select name="hobby">
                <option value="running">跑步</option>
                <option value="swimming">游泳</option>
            </select>
        </table>
        <div id="cc" class="easyui-calendar"></div>

        <h1 style="color: #f09090;background: #00ee00" >爱江山更爱美人</h1>
    </body>
</html>