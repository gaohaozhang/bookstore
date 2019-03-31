<%@ page language="java" import="java.util.*"import="java.sql.*" import ="java.util.ArrayList"  import="bean.Product" pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="bean.dbSQL" scope="page"/>
<jsp:useBean id="tool" class="bean.MyTools"scope="session"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

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
			<li><a href="sess.jsp" rel="nofollow" >注销</a></li>
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
								<li><a href="#">商品管理</a></li>
								<li>></li>
								<li><a href="insert.jsp">添加商品</a></li>
						</ul>
					
			</div>

			<div class="main">
  	<%     
            String bookid=request.getParameter("id");
            String bookname=request.getParameter("name");
            String author=request.getParameter("author");
            String date=request.getParameter("date");
            String publisher=request.getParameter("publisher");
            String pages=request.getParameter("page");
            String price=request.getParameter("price");
            String stock=request.getParameter("stock");
            String cons=request.getParameter("con");
            String classify=request.getParameter("classify");
            String recom=request.getParameter("recom");
            String image=request.getParameter("image");       
            request.setCharacterEncoding("UTF-8");//传值编码
            response.setContentType("text/html;charset=UTF-8");
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");   
			String url="jdbc:sqlserver://localhost:1433;DatabaseName=Bookdb";
		    String  user="sa";
		    String pass="zhang";
			Statement stmt=null;
	        Connection con=null;  
			con=DriverManager.getConnection(url,user,pass);  
			stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		    String sqli="insert into book values('"+bookname+"','"+bookid+"','"+author+"','"+date+"','"+publisher+"','"+pages+"','"+price+"','"+stock+"','"+image+"','"+cons+"','"+classify+"','"+recom+"')";           
            stmt.executeUpdate(sqli);		
            response.sendRedirect("select1.jsp");
            %>
               
		   
			</div>
		</div>
</div>	
<div class="bottom"></div>
<div id="footer"><p>Copyright©  2015 版权所有 京ICP备05019125号-10  来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p></div>
<script>navList(12);</script>
</body>
</html>
  </body>
</html>
