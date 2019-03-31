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
								<li><a href="select0.jsp">商品管理-查询商品</a></li>
						</ul>
					
			</div>

			<div class="main">
		    <%      
            String bookid=request.getParameter("id");
            request.setCharacterEncoding("UTF-8");//传值编码
            response.setContentType("text/html;charset=UTF-8");
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");   
			String url="jdbc:sqlserver://localhost:1433;DatabaseName=Bookdb";
		    String  user="sa";
		    String pass="zhang";
		    int pagesize= 5;  
            int pageCount; // 页数
            int curPage = 1;  //当前页
			Statement stmt=null;
	        Connection con=null;  
			con=DriverManager.getConnection(url,user,pass);  
			stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		    String sqls="select * from book where bookid='"+bookid+"'";			
			ResultSet rs=stmt.executeQuery(sqls);
			 rs.last();  
            int size = rs.getRow(); 
             pageCount = (size%pagesize==0)?(size/pagesize):(size/pagesize+1);  
            String tmp = request.getParameter("curPage");  
            if(tmp==null){tmp="1";  }  
            curPage = Integer.parseInt(tmp);  
            if(curPage>=pageCount) curPage = pageCount;  
            boolean flag = rs.absolute((curPage-1)*pagesize+1);          
            int count = 0;  %>
            <%if(size==0){ %>
	 <tr height="50">
     <td colspan="5" align="center">没有商品！</td>
     </tr>
       <%  }
     else{%>
    <table>
    
      <tr>
       <th>商品号</th>
        <th>商品名称</th>       
        <th>作者</th>
        <th>出版日期</th>
        <th>出版社</th>
        <th>页数</th>
        <th>价格</th>
      </tr>      
         <% 
   
           
            if(bookid!=""){
               do{ if(count>=pagesize)break;
               String bookname=rs.getString(1);
               //String bookid=rs.getString(2);
               String author=rs.getString(3);
               String date=rs.getString(4);
               String publisher=rs.getString(5);
               String pages=rs.getString(6);
               String price=rs.getString(7);
               count++; 
               %>
             <tr align="center">
             <td><%=bookid%></td>
             <td ><%=bookname%></td>      
             <td ><%=author%></td>
             <td ><%=date%></td>
             <td ><%=publisher%></td>
             <td ><%=pages%></td>
             <td ><%=price%></td>
             </tr>
               <% 
                }while(rs.next()); 
              
           %>
         </table>					
          
            <a href = "select.jsp?curPage=1&bookid=<%=bookid%>" >首页</a>  
            <a href = "select.jsp?curPage=<%=curPage-1%>&bookid=<%=bookid%>" >上一页</a>  
            <a href = "select.jsp?curPage=<%=curPage+1%>&bookid=<%=bookid%>" >下一页</a>  
            <a href = "select.jsp?curPage=<%=pageCount%>&bookid=<%=bookid%>" >尾页</a>  
                                 第<%=curPage%>页/共<%=pageCount%>页  
            <%
               }
              bookid="";
              rs.close(); 
              con.close(); } %> 
		   
			</div>
		</div>
</div>	
<div class="bottom"></div>
<div id="footer"><p>Copyright©  2015 版权所有 京ICP备05019125号-10  </p></div>
<script>navList(12);</script>
</body>
</html>