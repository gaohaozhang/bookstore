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
<title>后台模板管理系统-商品管理</title>
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
								<li><a href="delete.jsp">商品管理-删除商品</a></li>
						</ul>
					
			</div>

			<div class="main">
			<ul> <li>查询图书：</li>
		    <form  name="form1" action="delete.jsp"method="post" >
		            商品id:<input type="text" id="id" name="id">
		      <input style="color:#fff;"type="submit" class="submitLogin"  value="查 &nbsp; &nbsp;询" />
		      </form> 
		    <ul>
	<%      
            String bookid=request.getParameter("id");
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
		    String sqls="select * from book where bookid='"+bookid+"'";			
			ResultSet rs=stmt.executeQuery(sqls);
			while(rs.next()){
               String bookname=rs.getString(1);
               //String bookid=rs.getString(2);
               String price=rs.getString(7);
                String stock=rs.getString(8);
            %>
            <table>
		            商品号:<%=bookid%><br>
		            商品名称:<%=bookname%><br>
		            商品库存:<%=stock%><br>
		            商品价格:<%=price%><br>
		   </table> 
		   <li><a href="delete1.jsp?bookid=<%=bookid%>">删除商品</a></li>
            <%} %>
		   
			</div>
		</div>
</div>	
<div class="bottom"></div>
<div id="footer"><p>Copyright©  2015 版权所有 京ICP备05019125号-10  </p></div>
<script>navList(12);</script>
</body>
</html>