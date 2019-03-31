<%@ page language="java" import="java.util.*"import="java.sql.*" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台模板管理系统-月报表</title>
<link type="text/css" rel="stylesheet" href="style/css/css1/styles.css" />
<script type="text/javascript" src="style/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="style/js/menu.js"></script>
</head>

<body>
<%  
            request.setCharacterEncoding("UTF-8");//传值编码
            response.setContentType("text/html;charset=UTF-8");       
            session.getAttribute("id");
			%>
<div class="top"></div>
<div id="header">
	<div class="logo">萌猫图书后台管理系统</div>
	<div class="navigation">
		<ul>
		 	<li>欢迎您！</li>
			<li> <%=session.getAttribute("id")%>管理员</li>
			<li><a href="adminpsw.jsp">修改密码</a></li>
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
								<li><a href="mstm.jsp">报表管理-月报表</a></li>							
						</ul>
					
			</div>
		
			<div class="main">
		 		  
		    <%      
            
                
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
		    String date=new java.text.SimpleDateFormat("yyyy-MM").format(Calendar.getInstance().getTime()); 
		    String sqls="select SUM(total),SUM(ptotal)  from rstm where riqi LIKE'"+date+"%'";
		    ResultSet rs=stmt.executeQuery(sqls);   	
     	    if(!rs.next()){                    		    
		    %>
     <table>
     <tr height="50">
     <td colspan="5" align="center">无信息！</td>
     </tr>
     </table>
         <% }else{
         
         %>
       <table align="center" width=760> 
       <tr align="center"> 
       <th  colspan=2>月  报  表</th>
       </tr>
       <tr align="right">
       <th colspan=2>日期：<%=date %> </th>
       </tr>
       <tr>  
         <th>销售额</th>
         <th>销售利润</th>  
                    
      </tr>       
        
          <% 
              rs.beforeFirst();
              while(rs.next()){
         float ztotal=rs.getFloat(1);
         float ptotal=rs.getFloat(2); %>
          <tr align="center">
                            
             <td><%=ztotal%></td>      
             <td ><%=ptotal%></td> 
                         
             </tr>     				  
              <%}}  
                
                
              con.close();  %> 
                 </table>	
			</div>
		</div>
</div>
<div class="bottom"></div>
<div id="footer"><p>Copyright©  2015 版权所有 京ICP备05019125号-10  </p></div>
<script>navList(12);</script>
</body>
</html>
