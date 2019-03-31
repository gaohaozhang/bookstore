<%@ page language="java" import="java.util.*"import="java.sql.*" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台模板管理系统-日报表</title>
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
								<li><a href="rstm.jsp">报表管理-日报表</a></li>
								
								
						</ul>
					
			</div>
		
			<div class="main">
		 		  
		    <%      
            float ztotal=0;
                  float zptotal=0;
                
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
		    String date=new java.text.SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());                        		    
		    String sqls1="select orderid  from orderbasic where riqi='"+date+"'and zhuangtai='成功交易'";
		    ResultSet rs1=stmt.executeQuery(sqls1);   	
     	   if(!rs1.next()){       %>
     <table>
     <tr height="50">
     <td colspan="5" align="center">无信息！</td>
     </tr>
     </table>
         <% }  else{
         %>
       <table align="center" width=760> 
       <tr align="center"> 
       <th  colspan=6>日  报  表</th>
       </tr>
       <tr align="right">
       <th colspan=6>日期：<%=date %> </th>
       </tr>
       <tr>  
         <th>商品号</th>
         <th>商品名</th>
         <th>数量</th>
         <th>成本</th>
         <th>销售额</th>
         <th>销售利润</th>  
                    
      </tr>       
         <%
          rs1.beforeFirst();
          while(rs1.next())
            { String orderid=rs1.getString(1);
              Statement stmt2=null;
              stmt2=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);	                           
     		  String sqls2="select orderdetails.bookid,orderdetails.bookname,orderdetails.num ,orderdetails.sums  from orderbasic,orderdetails   where orderbasic.orderid=orderdetails.orderid and orderbasic.orderid='"+orderid+"'";
		      ResultSet rs2=stmt2.executeQuery(sqls2);
		       while(rs2.next())
              { 
               float total=0;
               int num=0;
               String bookid=rs2.getString(1);
               String bookname=rs2.getString(2);
               int mnum=rs2.getInt(3);//订单表中数量和总价
               float mtotal=rs2.getFloat(4);
              
               //先在日报表中查询有无bookid
               String sqls4="select num,total  from rstm   where rstm.bookid='"+bookid+"' ";
		       Statement stmt4=null;
		       stmt4=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);	       
               ResultSet rs4=stmt4.executeQuery(sqls4);
		       if(rs4.next()){//若有结果，则修改数据
		        int nnum=rs4.getInt(1);
		        float ntotal=rs4.getFloat(2);
		         num=mnum+nnum;
		         total=mtotal+ntotal;
		        Statement stmtu1=null;
		        stmtu1=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);				  
			    String sqlu="update rstm set num='"+num+"', total='"+total+"' where rstm.bookid='"+bookid+"'";			
			    stmtu1.executeUpdate(sqlu);
			    
                
		       } 
		       else{rs4.beforeFirst();
		            num=mnum;
		            total=mtotal;
                    String sqli1="insert into rstm values('"+orderid+"','"+bookid+"','"+bookname+"','"+num+"','"+total+"','0','0','"+date+"')"; 
                    Statement stmti=null;
		            stmti=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);	           
                    stmti.executeUpdate(sqli1);
             
               }	
               ztotal+=total;
                //float ztotal=0;
               // ztotal+=total;
     		   String sqls3="select cost.cost  from rstm,cost   where rstm.bookid=cost.bookid and rstm.bookid='"+bookid+"'";
		       Statement stmt3=null;
		       stmt3=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);	          
		        ResultSet rs3=stmt3.executeQuery(sqls3);     
		        while (rs3.next())
		        {float cost=rs3.getFloat(1);
                 float ptotal =total-num*cost;
                String sqlu1="update rstm set cost='"+cost+"', ptotal='"+ptotal+"' where rstm.bookid='"+bookid+"'";			
			    Statement stmtu1=null;
		         stmtu1=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);	           
                 stmtu1.executeUpdate(sqlu1);
              
                 zptotal+=ptotal;
                
             %> <tr align="center">
                            
             <td ><%=bookid%></td>
             <td><%=bookname%></td>      
             <td ><%=num%></td>   
             <td ><%=cost%></td>
             <td><%=total%></td>      
             <td ><%=ptotal%></td> 
                         
             </tr>     				  
            
          <%  }
           //out.println(ztotal);
                 //out.println(zptotal);
             
             }
       
                } //rs1     
       
                }                 %>
               
                 <tr align="center">
                            
             <td colspan=4 >总：</td>
             <td><%=ztotal%></td>      
             <td ><%=zptotal%></td>   
                 
             </tr>     
                
                
                <%              
             //else de 
            
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