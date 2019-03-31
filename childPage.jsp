<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Author" content="author by using 20121016 QQ:471116029">
<title>差旅人选择</title>
 
</head>
<script language="javascript"> 
/* checkbox全选 */
function checkAll(){
    var item = document.getElementsByName("checkedItem");
    for (var i = 0; i < item.length; i++) {
        if (true == document.getElementById("checked").checked) {
            item[i].checked = true;
        } else {
            item[i].checked = false;
            /* 删除已经选择的差旅人 */
            parent.deliveryDeleteSignRow("",item[i].value.split("-")[0]);
        }
    }
}
  
/* 取消最顶端的checkbox的checked属性 */
function checkFalse() {
    var item = document.getElementsByName("checkedItem");
    var count = 0;
    for (var i = 0; i <item.length; i++) {
        if (item[i].checked == false) {
            count += i;
            document.getElementById("checked").checked = false;
            break;
        }
        if(count == 0) {
            document.getElementById("checked").checked = true;
        }
         
    }
}
//增加父页面差旅人
function add(){
    var checks = document.getElementsByName("checkedItem");
    var tempRes = false;
    var checked = false; //checkbox是否选择
    for (var i = 0; i < checks.length; i++) {
        if (checks[i].checked == true) {
            var txtTRLastIndex = window.parent.document.getElementById("certTRLastIndex");
            var rowID = parseInt(txtTRLastIndex.value); //父页面上存在的差旅人列表 的行数
            if (rowID != 0) {
                /* 页面上已有差旅人的情况，判断是否差旅人是否重复 */
                var tempItem = window.parent.document.getElementsByName("checkedItem");
                for (var j = 0; j < rowID; j++) {
                    /* 页面已有差旅人列表的值 于 选择的差旅人做比较，如果不存在则添加，存在提示差旅人已存在 */
                    if(tempItem[j] != null && checks[i] != null) {
                        if (tempItem[j].value == checks[i].value.split("-")[0]) {
                            //alert("列表中已经存在差旅人:" + checks[i].value.split("-")[1] + "!");
                            tempRes = true;
                        }
                    }
                }
            }
            /* 已选择差旅人 */
            checked = true;
            /* 页面上无差旅人的情况，添加差旅人到列表 */
            if (tempRes == false) {
                window.parent.changgeTriverRes(checks[i].value);
            }
        }
        tempRes = false;
    }
    /* 未选择差旅人提示选择 */
    if (!checked) {
        //alert("请选择差旅人!");
        return;
    }   
}
  
/* 去掉勾选删掉已有差旅人 */
function delRows(userid) {
    if(document.getElementById("checkedItem_" + userid).checked == false) {
        if(parent.document.getElementById("tableRows_" + userid) != null) {
            var rowId = parent.document.getElementById("tableRows_" + userid).value;
            parent.deliveryDeleteSignRow(rowId,userid);
        }
    }
}
  
function loadTravel() {
     var tempItem = window.parent.document.getElementsByName("checkedItem");
     for (var j = 0; j < tempItem.length; j++) {
        if(document.getElementById("checkedItem_"+tempItem[j].value) != null) {
            document.getElementById("checkedItem_"+tempItem[j].value).checked = true;
        }
     }
     checkFalse(); //勾选最顶端的checkbox
}
 
</script>
 
<body onload="loadTravel()">
 
<table style="width:780px">
  <tr>
    <td><input id="checked" name="checked" type="checkbox" onclick="checkAll();add();" /></td>
    <td>中文姓名</td>
    <td>英文姓名</td>
    <td>手机号码</td>
    <td>邮箱</td>
  </tr>
    <!-- 动态查询出来的员工数据 -->
      <tr>
        <td>
            <!-- value值分别为，数据库主键ID(此项必须)，姓名，英文姓名，手机号码，email -->
            <input id="checkedItem_382" name="checkedItem" value="382-张三-zhangsan-13813813813-123456@qq.com" type="checkbox" onclick="checkFalse();add();delRows('382');" />
        </td>
        <td>张三</td>
        <td>zhangsan</td>
        <td>13813813813</td>
        <td>123456@qq.com</td>
      </tr>
      <tr>
        <td>
            <input id="checkedItem_418" name="checkedItem" value="418-李四-lisi-13913913911-123456@qq.com" type="checkbox" onclick="checkFalse();add();delRows('418');" />
        </td>
        <td>李四</td>
        <td>lisi</td>
        <td>13913913911</td>
        <td>123456@qq.com</td>
      </tr>
 
</table>
 
 
</body>
</html>
