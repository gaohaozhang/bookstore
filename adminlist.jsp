<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台模板管理系统</title>
<link type="text/css" rel="stylesheet" href="style/css/css1/styles.css" />
<script type="text/javascript" src="style/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="style/js/menu.js"></script>
</head>
  
  <body>
   <div class="left_menu">
				<ul id="nav_dot">
      <li>
          <h4 class="M1"><span></span>商品管理</h4>
          <div class="list-item none">
            <a href="select0.jsp">查询商品</a>
            <a href="delete.jsp">删除商品</a>
            <a href="insert.jsp">添加商品</a>
       
          </div>
        </li>
        
        <li>
          <h4 class="M2"><span></span>用户请求管理</h4>
          <div class="list-item none">
            <a href="returngoods.jsp">退货处理</a>
            <a href="deliver.jsp">发货管理</a>
                
           </div>
        </li>
        <li>
          <h4 class="M3"><span></span>订单管理</h4>
          <div class="list-item none">
            <a href="sussorder.jsp">查询订单-成功交易</a>
            <a href="failorder.jsp">查询订单-失败交易</a>
            <a href="succq.jsp">查询订单-已发货</a>
          </div>
        </li>
				<li>
          <h4 class="M4"><span></span>留言板管理</h4>
          <div class="list-item none">
            <a href="adminmsg.jsp">留言板</a>
            
          </div>
        </li>
				<li>
          <h4 class="M5"><span></span>信息设置</h4>
          <div class="list-item none">
            <a href="adminpsw.jsp">密码修改</a>
           
          </div>
        </li>
        <li>
          <h4 class="M5"><span></span>报表管理</h4>
          <div class="list-item none">
            <a href="purchase.jsp">采购报表</a>
            <a href="rstm.jsp">日报表</a>
            <a href="mstm.jsp">月报表</a>
          </div>
        </li>
				
		</div>
  </body>
</html>
