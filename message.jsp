<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mydetail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

<style type="text/css"></style>
<meta content="no-siteapp" http-equiv="Cache-Control">
<link  media="handheld" rel="alternate">
<!-- end 云适配 -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>我的萌猫</title>
<meta content="23635710066417756375" property="qc:admins">

<!-- <div class="web_root"  style="display:none">http://www.lagou.com</div> -->
<script type="text/javascript">
var ctx = "http://www.lagou.com";
console.log(1);
</script>
<link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon">
<link href="style/css/style.css" type="text/css" rel="stylesheet">
<link href="style/css/external.min.css" type="text/css" rel="stylesheet">
<link href="style/css/popup.css" type="text/css" rel="stylesheet">


<script type="text/javascript">
var youdao_conv_id = 271546; 
</script> 
</head>
<body>
<div id="body">
 	
	<div id="header">
    	<%@ include file="top.jsp" %>   
    </div><!-- end #header -->
    <div id="container">
            
        	<div class="sidebar">
            	<a class="btn_create" href="message.jsp">留言板</a>
                <dl class="company_center_aside">
		<dt>我的信息:</dt>
		<dd><%= session.getAttribute("phone")%></dd>
	   
               </dl>
               
                <div class="subscribe_side mt20">
   <div class="f14">想了解更多图书</div>
   <div class="f18 mb10">进入论坛和书友交流吧！ </div>
   <div>进入：<a class="f16" href="message.jsp">talking@miao.com</a></div>
   
               </div>
            </div><!-- end .sidebar -->
            <div class="content">
            	<dl class="company_center_content">
                    <dt><h1><em></em>留言板</h1></dt>
	                <dd>
	                <form action="" method="post">
         <textarea rows="20" cols="60" name="t1"></textarea><br><br>       
        <input type="submit" name="submit" value="发送"><br>
       </form>
                        
          <%   request.setCharacterEncoding("UTF-8");//传值编码
               response.setContentType("text/html;charset=UTF-8");
               if(application.getAttribute("chat")==null)
               {application.setAttribute("chat","");}
               else{
                 if(request.getParameter("submit")!=null)
                 { 
                  String text=request.getParameter("t1");
                  int size=0;
                 if(!("".equals(text))){
                   String date=new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime());                         
                  text= session.getAttribute("phone")+":"+text+"<br>"+date+"<br><br>"+(String)application.getAttribute("chat")+"<br>";
                  application.setAttribute("chat", text);
      }}}
                  
           out.println("<br>"+(String)application.getAttribute("chat")+"<br>");  
          
			%>   
                        	
                        
	                </dd>
            	</dl>
       		</div>
       		   <!-- end .content -->
       				
<style>
.jiathis_style_32x32 .jiathis_txt{font-size:14px!important;text-decoration:underline!important;padding-left:0 !important;}
.jiathis_style_32x32 .jiathis_separator{margin:0!important; line-height:22px !important;}
.jiathis_style_32x32 .jtico{height:auto !important;background:none;line-height:22px !important;padding-left:0 !important;}
</style>


			<div class="clear"></div>
			
	    </div><!-- end #container -->
	</div><!-- end #body -->
	<div id="footer">
	<%@ include file="footer.jsp" %>   
        </div>
       
    <!-- end footer -->
   




</body></html>