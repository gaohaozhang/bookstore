<%@ page language="java" import="java.util.*"  import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
   <script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate" media="handheld"  />
<!-- end 云适配 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员-登录</title>
<meta property="qc:admins" content="23635710066417756375" />


<meta name="baidu-site-verification" content="QIQ6KC1oZ6" />


<link rel="Shortcut Icon" href="h/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="style/css/style.css"/>

<script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>

<script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
<script type="text/javascript" src="style/js/core.min.js"></script>


<script type="text/javascript">
var youdao_conv_id = 271546; 
</script>   
</head>

<body id="login_bg">

<script type="text/javascript">
function checkpsw()
{  var p1=document.form1.userpassword;
    var p2=document.form1.userpassword2;
    if(p1.value!=p2.value)
    {  alert('两次输入密码不一致！请重新输入');
       document.form1.userpasssword.focus();
       return false;
    }
    else{
   
    return true;}


}
</script> 
	<div class="login_wrapper">
		<div class="login_header">
        	<a href="h/"><img src="style/pictures/logo.png" width="200" height="90" alt="萌猫图书" /></a>
            <div id="cloud_s"><img src="style/pictures/cloud_s.png" width="81" height="52" alt="cloud" /></div>
            <div id="cloud_m"><img src="style/pictures/cloud_m.png" width="136" height="95"  alt="cloud" /></div>
        </div>
        
    	<input type="hidden" id="resubmitToken" value="" />		
		 <div class="login_box">
        	<form id="loginForm" name="form1" action="adresetp1.jsp"method="post" onsubmit="return checkpsw();">
			   <input type="text" id="tel" name="userpassword" value="请输入密码"   onfocus="this.value=''" onblur="if(this.value==''){this.value='请输入密码'}" />			
			      <input type="text"  id="password"name="userpassword2" value="请再次输入密码"  onChange="checkpsw()" onfocus="this.value=''" onblur="if(this.value==''){this.value='请再次输入密码'}" />			         
		         
			    
		  <input style="color:#fff;"type="submit" class="submitLogin"id="submitLogin"   title="修 &nbsp; &nbsp; 改" value="修 &nbsp; &nbsp; 改" />
			  	<ul><a href="backstage.jsp">返回后台系统</a></ul>
			</form>
			<div class="login_right">
			
			</div>
        </div>
        <div class="login_box_btm"></div>
    </div>
<%    String tempflag=request.getParameter("flag");
      String tempid=request.getParameter("id"); 
 %>    


</body>
</html>