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
 <%         session.getAttribute("phone");
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
			String sqls="select * from login where tel='"+session.getAttribute("phone")+"'";			
			ResultSet rs=stmt.executeQuery(sqls);			
           while(rs.next())
            {  String count=rs.getString(3);
             %>		
	<div id="header">
    	<%@ include file="top.jsp" %>   
    </div><!-- end #header -->
    <div id="container">
            
        	<div class="sidebar">
            	<a class="btn_create" href="mydetail.jsp">我的萌猫</a>
                <dl class="company_center_aside">
		<dt>个人信息管理</dt>
		<dd><a href="resetpsw.jsp">密码修改</a></dd>
	    <dd><a href="order.jsp">订单查看</a></dd>
               </dl>
             
                <div class="subscribe_side mt20">
   <div class="f14">想了解更多图书</div>
   <div class="f18 mb10">进入论坛和书友交流吧！ </div>
   <div>进入：<a class="f16" href="message.jsp">talking@miao.com</a></div>
   
               </div>
            </div><!-- end .sidebar -->
            <div class="content">
            	<dl class="company_center_content">
                    <dt><h1><em></em>我的信息</h1></dt>
	                <dd>
                        <div class="weixin weixinSuc">
                        	<div class="qr">
                        		
                        		<div>会员名：<%=session.getAttribute("phone")%></div>
                        	
                        	</div>
                        	
                        </div>
	                </dd>
            	</dl>
       		</div><!-- end .content -->
       		<% 
            }            
            rs.close();
            stmt.close();
            con.close();
          
			%>		
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