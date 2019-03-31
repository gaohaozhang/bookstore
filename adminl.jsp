<%@ page language="java" import="java.util.*"  import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员登录</title>
    
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
 function checkUser(action){
    form1.action=action;
    form1.submit();
  }
function checktel(){
     var t=document.form1.tel.value;
     var len=t.length;  
      if(len!=4){
      alert('请输入4位管理员账号');}
      if( t== "")      { 
      document.getElementById("tel").value="账号不能为空";      
      document.form1.tel.focus();     
      return false;      }           
      var strP=/^\d+$/;    //判断是否为数字的表达式      
      if(!strP.test(t))      {     
      document.getElementById("tel").value="账号非数字格式";         
        document.form1.tel.focus();          
       return false;      }
}
function checkpsw(){
     var p=document.form1.psw.value;   
      if( p== "")      { 
      document.getElementById("password").value="密码不能为空";      
      document.form1.psw.focus();     
      return false;      }           
     
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
        	<form id="loginForm" name="form1" action="backstage.jsp"method="post" onsubmit="checkUser('admin0.jsp');">
			<input type="text" id="tel" name="tel" value="请输入管理员账号"  onChange="checktel()" onKeyDown="onlyNum()"  onfocus="this.value=''" onblur="if(this.value==''){this.value='请输入管理员账号'}" />			
			<input type="text" id="password" name="psw" value="请输入密码"  onChange="checkpsw()" onfocus="this.value=''" onblur="if(this.value==''){this.value='请输入密码'}" />	
		<span class="error" style="display:none;" id="beError"></span>
			    
		  <input style="color:#fff;"type="submit" class="submitLogin"id="submitLogin"   title="登 &nbsp; &nbsp; 录" value="登 &nbsp; &nbsp; 录" />
			   
			</form>
			<div class="login_right">
			
			</div>
        </div>
        <div class="login_box_btm"></div>
    </div>
<%    String tempflag=request.getParameter("flag");
      String tempid=request.getParameter("id"); 
 %>    
<script type="text/javascript">
  tel_flag='<%=tempflag%>';
  var id='<%=tempid%>';
  if(tel_flag!=null&&id!=null)
  {
    if(tel_flag==1)
    {alert('成功登录');
    }
    if(tel_flag==0)
    {
    alert('密码不正确或请先进行管理员注册');
    }
  }

</script>

</body>
</html>