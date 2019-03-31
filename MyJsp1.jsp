<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<meta name="Author" content="author by using 20121016 QQ:471116029">
<title>差旅人选择</title>
 
<script language="JavaScript"> 
 
    /* 已有差旅人JS， begin */
    function changgeTriverRes(checks) {
        var tempArr = checks.split("-");
        certRow(tempArr[0],tempArr[1],tempArr[2],tempArr[3],tempArr[4]);
    }
    /* 创建新的一行 */
    function certRow(args1,args2,args3,args4,args5)
    {
        document.getElementById("triveralDiv").style.display = "block";
        var txtTRLastIndex = document.getElementById("certTRLastIndex");
        var rowID = parseInt(txtTRLastIndex.value);
        var MyTable =  document.getElementById("certTable");
        var newTr = MyTable.insertRow(MyTable.rows.length);
        newTr.id = "certItem" + args1;
        //添加5列
        var newTd0 = newTr.insertCell(0);
        var newTd1 = newTr.insertCell(1);
        var newTd2 = newTr.insertCell(2);
        var newTd3 = newTr.insertCell(3);
        var newTd4 = newTr.insertCell(4);
        var newTd5 = newTr.insertCell(5);
         
        newTd0.innerHTML = '&nbsp;&nbsp;';
        newTd1.innerHTML = '<div title="' + args2 + '" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;width:120px;cursor: pointer;">' + args2 + '</div>' + '<input type="hidden" id="checkedItem" name="checkedItem" value="' + args1 + '" />';
        newTd2.innerHTML = '<div>' + args3 + '</div>';
        newTd3.innerHTML = '<div>' + args4 + '</div>';
        newTd4.innerHTML = '<div>' + args5 + '</div>';
        newTd5.innerHTML = '<div><input type="hidden" id="tableRows" name="tableRows" value="certItem'+ rowID +'" /><input type="hidden" id="tableRows_'+args1+'" value="certItem'+ rowID +'" /><input type="button" value="删除" onclick="deliveryDeleteSignRow(\'certItem' + rowID + '\','+args1+'\);"/></div>';
        txtTRLastIndex.value = (rowID + 1).toString();
         
         
    }
    function deliveryDeleteSignRow(rowid,userid){
        var MyTable = document.getElementById("certTable");
        var signItem = document.getElementById("certItem"+userid);
  
        var txtTRLastIndex = document.getElementById("certTRLastIndex");
        var rowIDZ = parseInt(txtTRLastIndex.value);
  
        //获取将要删除的行的Index
        var rowIndex = signItem.rowIndex;
  
        //删除指定Index的行
        if (typeof(rowIndex) =="undefined")   {
            rowIndex = rowIDZ+1;
        }
        MyTable.deleteRow(rowIndex);
        txtTRLastIndex.value = (rowIDZ - 1).toString() ;
 
        /* 隐藏已有的差旅人列表DIV */
        if(txtTRLastIndex.value == "0") {
            document.getElementById("triveralDiv").style.display = "none";
        }
        /* 取消子页面上对应的差旅人checkbox的勾 */
        if(window.frames['iframeResult'].document.getElementById("checkedItem_"+userid) != null) {
            window.frames['iframeResult'].document.getElementById("checkedItem_"+userid).checked = false;
            window.frames['iframeResult'].checkFalse(); //去除顶部checkbox
        }
    }
    /* 已有差旅人JS， end */
     
     
</script>
</head>
<body>
<% String orderid="";       
orderid=new String(request.getParameter("orderid").getBytes("ISO-8859-1"),"utf-8");
out.println(orderid);
 %>

<form action="" id="frm" method="post" name="frm">
<div style="display: none" id="triveralDiv">
  <table id="certTable" style="width:780px">
        <tr height="10px;">
          <td><input name='certTRLastIndex' type='hidden' id='certTRLastIndex' value="0" /></td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;</td>
            <td><font color="#065991">中文姓名</font></td>
            <td><font color="#065991">英文姓名</font></td>
            <td><font color="#065991">手机号码</font></td>
            <td><font color="#065991">Email邮箱</font></td>
            <td><font color="#065991">删除</font></td>
        </tr>
  </table>
</div>
 
<br/>
<br/>
<br/>
 
<!--  差旅人查询结果 --可以调用数据库动态产生，使用iframe是为了，结果翻页的时候不把上面已经存在的差旅人列表给清空掉,也可以不是用iframe考虑ajax获取数据 -->
<iframe src="childPage.jsp" id="iframeResult" name="iframeResult" height="150" width="100%" scrolling="no" marginwidth="0" frameborder="0" style=""></iframe>
 
</form>
</body>
</html>

