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
    
    <title>My JSP 'insert1.jsp' starting page</title>
    
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
   	<%     
            String bookid=request.getParameter("id");
            String bookname=request.getParameter("name");
            String author=request.getParameter("author");
            String date=request.getParameter("date");
            String publisher=request.getParameter("publisher");
            String pages=request.getParameter("page");        
            String cost =request.getParameter("cost");
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
            String sqli1="insert into cost values('"+bookid+"','"+cost+"')";           
            stmt.executeUpdate(sqli1);		
            response.sendRedirect("select1.jsp");
            %>
  </body>
</html>
