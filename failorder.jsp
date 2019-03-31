<%@ page language="java" import="java.util.*"import="java.sql.*" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台模板管理系统-失败交易</title>
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
								<li><a href="failorder.jsp">订单管理-失败订单</a></li>
						</ul>
					
			</div>
		
			<div class="main">
		 <ul> <li>订单号：</li>
		    <form  name="form1" action="failorder1.jsp"method="post" >
		      <input type="text" id="id" name="id">
		      <input style="color:#fff;"type="submit" class="submitLogin"  value="查询" />
		      </form></ul> 
		  
		    <%      
           
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
		    String sqls="select orderbasic.orderid,riqi,bookid,bookname,num,zhuangtai,name,phone,address   from orderbasic,orderdetails where orderbasic.orderid=orderdetails.orderid and zhuangtai='失败交易'  ";			
			ResultSet rs=stmt.executeQuery(sqls);
			 rs.last();  
            int size = rs.getRow(); 
             pageCount = (size%pagesize==0)?(size/pagesize):(size/pagesize+1);  
            String tmp = request.getParameter("curPage");  
            if(tmp==null){tmp="1";  }  
            curPage = Integer.parseInt(tmp);  
            if(curPage>=pageCount) curPage = pageCount;  
            boolean flag = rs.absolute((curPage-1)*pagesize+1);          
            int count = 0;  
            if(size==0){ 
            %>
     <table>
     <tr height="50">
     <td colspan="5" align="center">订单为空！</td>
     </tr>
     </table>
         <% }  else{%>             
    <table> 
      <tr>
      <th>日期</th>
       <th>订单号</th>
        <th>商品号</th>
         <th>商品名</th>
        <th>数量</th>           
        <th>收货人</th>
        <th>电话</th>
        <th>地址</th>
        <th>状态</th>      
      </tr>      
         <% do{ if(count>=pagesize)break;
             String orderid=rs.getString(1);
               String riqi=rs.getString(2);
               String bookid=rs.getString(3);
               String bookname=rs.getString(4);
               String num=rs.getString(5);
               String zhuangtai=rs.getString(6);
               String name=rs.getString(7);
               String phone=rs.getString(8);
               String address=rs.getString(9);            
               count++; 
               %>
             <tr align="center">
             <td><%=riqi%></td>
             <td><%=orderid%></td>
             <td ><%=bookid%></td>
             <td><%=bookname%></td>      
             <td ><%=num%></td>
             <td ><%=name%></td>
             <td ><%=phone%></td>
             <td ><%=address%></td>
             <td ><%=zhuangtai%></td>
             </tr>
               <% 
                }while(rs.next()); 
              
           %>
         </table>					
          
            <a href = "sussorder.jsp?curPage=1" >首页</a>  
            <a href = "sussorder.jsp?curPage=<%=curPage-1%>" >上一页</a>  
            <a href = "sussorder.jsp?curPage=<%=curPage+1%>" >下一页</a>  
            <a href = "sussorder.jsp?curPage=<%=pageCount%>" >尾页</a>  
                                 第<%=curPage%>页/共<%=pageCount%>页  
            <%
              }
              rs.close(); 
              con.close();  %> 
			</div>
		</div>
</div>
<div class="bottom"></div>
<div id="footer"><p>Copyright©  2015 版权所有 京ICP备05019125号-10  </p></div>
<script>navList(12);</script>
</body>
</html>