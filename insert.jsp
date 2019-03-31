<%@ page language="java" import="java.util.*"import="java.sql.*" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台模板管理系统</title>
<link type="text/css" rel="stylesheet" href="style/css/css1/styles.css" />
<script type="text/javascript" src="style/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="style/js/menu.js"></script>
</head>

<body>
<div class="top"></div>
<div id="header">
	<div class="logo">萌猫图书后台管理系统</div>
	<div class="navigation">
		<ul>
		 	<li>欢迎您！</li>
			<li> <%=session.getAttribute("id")%>管理员</li>
			<li><a href="">修改密码</a></li>
			<li><a href="adminsess.jsp" rel="nofollow" >注销</a></li>
		</ul>
	</div>
	
</div>
<div id="content">
	 <%@ include file="adminlist.jsp" %>
		<div class="m-right">
			<div class="right-nav">
					<ul>
							<li></li>
								<li style="margin-left:25px;">您当前的位置：</li>
								<li><a href="backstage.jsp">后台管理系统</a></li>
								
								<li>></li>
								<li><a href="insert.jsp">商品管理-添加商品</a></li>
						</ul>
					
			</div>
<script type="text/javascript">
        function check(){
         var t1=document.form1.name.value;
         var t2=document.form1.author.value;
         var t3=document.form1.date.value;
         var t4=document.form1.publisher.value;
         var t5=document.form1.page.value;
         var t6=document.form1.cost.value;
         var t7=document.form1.price.value;
         var t8=document.form1.stock.value;
         
         var t9=document.form1.classify.value;
        
         var t10=document.form1.image.value;       
         if( t1== ""||t2==""||t3== ""||t4==""||t5== ""||t6==""||t7== ""||t8==""||t9==""||t10=="")      { 
         alert("数据不能为空！");    
         return false;      }    
         else{
         
         return true; } 
             
   }
    
</script>
			<div class="main">
			<ul> <li>添加图书商品：</li>
		    <form  name="form1" action="insert1.jsp"method="post" >
		         <li>   商品号:<input type="text" id="id" name="id"><br><br></li>
		             商品名称<input type="text" id="id" name="name"><br><br>
		             商品作者:<input type="text" id="id" name="author"><br><br>
		              出版日期:<input type="text" id="id" name="date"><br><br>
		             出版社:<input type="text" id="id" name="publisher"><br><br>
		             商品页码:<input type="text" id="id" name="page"><br><br>
		             商品成本:<input type="text" id="id" name="cost"><br><br>
		             商品价格:<input type="text" id="id" name="price"><br><br>
		             商品库存:<input type="text" id="id" name="stock"><br><br>
		            商品内容:<br>
		            <TextArea Rows=5 cols=25 name="con"></TextArea><br><br>
		             商品类别:<input type="text" id="id" name="classify"><br><br>
		              推荐语:<input type="text" id="id" name="recom">   <br><br>
		             商品图片:<input type="text" id="id" name="image">      <br><br>                 
		      <input style="color:#fff;"type="submit" class="submitLogin" onclick="return check();" value="添&nbsp; &nbsp;加" />
		      </form> 
		    <ul>

           
            
		   
			</div>
		</div>
</div>	
<div class="bottom"></div>
<div id="footer"><p>Copyright©  2015 版权所有 京ICP备05019125号-10  </p></div>
<script>navList(12);</script>
</body>
</html>