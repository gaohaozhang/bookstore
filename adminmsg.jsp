<%@ page language="java" import="java.util.*"import="java.sql.*" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台模板管理系统-留言板管理</title>
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
								<li><a href="backstage.jsp">后台管理系统></a></li>
								<li><a href="adminmsg.jsp">留言板管理</a></li>
						</ul>
					
			</div>
		
			<div class="main">
		  
	     <form action="" method="post">
         <textarea rows="20" cols="60" name="t1"></textarea><br><br>       
          <input type="submit" name="submit" value="发送">
         
                  <a href="adminmsg.jsp?action=clear">删除留言板</a>
                  
         </form>
                        
          <%   request.setCharacterEncoding("UTF-8");//传值编码
               response.setContentType("text/html;charset=UTF-8");
               String action=request.getParameter("action");
                if(action==null)action="";
               if(action.equals("clear"))
               {application.removeAttribute("chat");
                }
               if(application.getAttribute("chat")==null)
               {application.setAttribute("chat","");}
               else{
                 if(request.getParameter("submit")!=null)
                 { 
                  String text=request.getParameter("t1");
                  
                 if(!("".equals(text))){
                   String date=new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime());                         
                  text= session.getAttribute("id")+"管理员:"+text+"<br>"+date+"<br><br>"+(String)application.getAttribute("chat")+"<br>";
                  application.setAttribute("chat", text);
      }}}
                  
           out.println("<br>"+(String)application.getAttribute("chat")+"<br>");  
          
			%>   
                        	
                        
	                </dd>
            	</dl>
       	
			</div>
		</div>
</div>
<div class="bottom"></div>
<div id="footer"><p>Copyright©  2015 版权所有 京ICP备05019125号-10  </p></div>
<script>navList(12);</script>
</body>
</html>
