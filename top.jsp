<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
<script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate" media="handheld"  />
<!-- end 云适配 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>萌猫网-好看的图书都在这里！</title>
<meta property="qc:admins" content="23635710066417756375" />


<!-- <div class="web_root"  style="display:none">h</div> -->
<script type="text/javascript">
var ctx = "h";
console.log(1);
</script>
<link rel="Shortcut Icon" href="h/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="style/css/style.css"/>
<link rel="stylesheet" type="text/css" href="style/css/external.min.css"/>
<link rel="stylesheet" type="text/css" href="style/css/popup.css"/>

</head>

 <body>

<%    session.getAttribute("phone");
 %>
    	<div class="wrapper">
    		<a href="dreamcat.jsp" class="logo">
    			<img src="style/pictures/logo.png" width="229" height="78" alt="萌猫图书" />
    		</a>
    		<ul class="reset" id="navheader">
    			<li class="current"><a href="dreamcat.jsp">首页</a></li>
    			<li ><a href="mydetail.jsp" onclick="return login();">我的萌猫</a></li>
    			<li ><a href="message.jsp" onclick="return login();">留言板</a></li>  		   
	    		<li ><a href="showcar.jsp" onclick="return login();" >购物车</a></li>
	        </ul>
<script type="text/javascript">
        function login(){
        if(<%=session.getAttribute("phone")%>!=null)
         { return true; } 
         else{
         alert('请先登录或注册');
         return false; } 
             
   }
    
</script>
        	<ul class="loginTop">
        	<%
          if(null!=session.getAttribute("phone"))
              {
  
 %>
            	<li><%=session.getAttribute("phone")%>,欢迎你!</li>
            	<li>|</li>
                <li><a href="sess.jsp" rel="nofollow" >注销</a></li>
                 </ul>
        </div>

    <!-- end #header -->
                <%}
                else{
                %>
	
                <li><a href="login.jsp" rel="nofollow">登录</a></li> 
            	<li>|</li>
            	<li><a href="register.jsp" rel="nofollow">注册</a></li>
            	
            </ul>
        </div>
       
    <!-- end #header -->
 <%} %>
    
  
</body>
</html>
