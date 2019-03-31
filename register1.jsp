<%@ page language="java" import="java.util.*" import="java.sql.*"pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register1.jsp' starting page</title>
    
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
   <%      String tel=request.getParameter("tel"); 
           String psw=request.getParameter("psw");   
               
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");   
			String url="jdbc:sqlserver://localhost:1433;DatabaseName=Bookdb";
		    String  user="sa";
		    String pass="zhang";
			Statement stmt=null;
	        Connection con=null;  
			con=DriverManager.getConnection(url,user,pass);  
			stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);			
			String sqls="select * from login where tel='"+tel+"'";
			ResultSet rs=stmt.executeQuery(sqls);			           
             if(!rs.next())//注册检查
            { String sqli="insert into login values('"+tel+"','"+psw+"',0,0)";
            stmt.executeUpdate(sqli);
              response.sendRedirect("dreamcat.jsp");
               session.setAttribute("phone",tel);}
            else
            { response.sendRedirect("register.jsp?flag=1&name="+tel);}
            rs.close();
            stmt.close();
            con.close();
%>
  </body>
</html>
