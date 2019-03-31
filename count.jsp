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
<meta name="description" content="拉勾网是3W旗下的互联网领域垂直招聘网站">
<meta name="keywords" content="拉勾,拉勾网,拉勾招聘,拉钩, 拉钩网 ,互联网招聘,拉勾互联网招聘, 移动互联网招聘, 垂直互联网招聘, 微信招聘, 微博招聘, 拉勾官网, 拉勾百科,跳槽, 高薪职位, 互联网圈子, IT招聘, 职场招聘, 猎头招聘,O2O招聘, LBS招聘, 社交招聘, 校园招聘, 校招,社会招聘,社招">
<meta content="QIQ6KC1oZ6" name="baidu-site-verification">

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
<body><link href="style/css/jiathis_share.css" rel="stylesheet" type="text/css"><iframe frameborder="0" style="position: fixed; display: none; opacity: 0;"></iframe><div class="jiathis_style" style="position: absolute; z-index: 1000000000; display: none; top: 50%; left: 50%; overflow: auto;"></div><div class="jiathis_style" style="position: absolute; z-index: 1000000000; display: none; overflow: auto;"></div><iframe frameborder="0" style="display: none;" src="http://v3.jiathis.com/code_mini/jiathis_utility.html"></iframe>
<div id="body">
	<div id="header">
    	<%@ include file="top.jsp" %>   
    </div><!-- end #header -->
    <div id="container">
            
        	<div class="sidebar">
            	<a class="btn_create" href="mydetail.jsp">我的萌猫</a>
                <dl class="company_center_aside">
		<dt>个人信息管理</dt>
		<dd><a href="">密码修改</a></dd>
	    <dd><a href="order.jsp">订单查看</a></dd>
               </dl>
               <dl class="company_center_aside">
		<dt>积分管理</dt>
	    <dd><a href="mycount.jsp">我的积分</a></dd>
	    <dd><a href="count.jsp">积分制解说</a></dd>
	          </dl>
                <div class="subscribe_side mt20">
   <div class="f14">想了解更多图书</div>
   <div class="f18 mb10">进入论坛和书友交流吧！ </div>
   <div>进入：<a class="f16" href="talk.jsp">talking@miao.com</a></div>
               </div>
            </div><!-- end .sidebar -->
            <div class="content">
            	<dl class="company_center_content">
                    <dt><h1><em></em>积分制解说</h1></dt>
	                <dd>
                        <div class="weixin weixinSuc">
                       <div class="qr">
                       <center><font face="黑体" size="4">
                                                                       什么是萌猫积分？</font> </center>                                                                      	
                        <font face="黑体" size="3">在萌猫官网购买图书之后收到图书确认收货后将根据商品总金额返还积分。 
                                                  普通会员消费1元返100积分。（积分返回比例将不定期调整，实际返还积分以图书页面介绍为准。）
                                                  积分可以用于抵扣，例如：您的订单为10.2元，那么使用20的积分即可支付0.2元，你只要支付另外的10元即可。   	
                        	</font>	
                      
                        </div>
                        	
                        </div>
	                </dd>
            	</dl>
       		</div><!-- end .content -->
<style>
.jiathis_style_32x32 .jiathis_txt{font-size:14px!important;text-decoration:underline!important;padding-left:0 !important;}
.jiathis_style_32x32 .jiathis_separator{margin:0!important; line-height:22px !important;}
.jiathis_style_32x32 .jtico{height:auto !important;background:none;line-height:22px !important;padding-left:0 !important;}
</style>


			<div class="clear"></div>
			<input type="hidden" value="e0b2bdfab8ab466cb973d5ee5acc6adb" id="resubmitToken">
	    	<a rel="nofollow" title="回到顶部" id="backtop"></a>
	    </div><!-- end #container -->
	</div><!-- end #body -->
	<div id="footer">
	<%@ include file="footer.jsp" %>   
        </div>
       
    <!-- end footer -->
   
<script src="style/js/core.min.js" type="text/javascript"></script>
<script src="style/js/popup.min.js" type="text/javascript"></script>

<!--  -->



</body></html>