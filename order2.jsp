<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>待收货</title>
    
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
<meta content="QIQ6KC1oZ6" name="baidu-site-verification">




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
		<dd><a href="resetpsw.jsp">密码修改</a></dd>
	    <dd><a href="order.jsp">订单查看</a></dd>
	     <dd><a href="returnorder.jsp" target="_blank">退货请求</a></dd>
	   
               </dl>
              
                <div class="subscribe_side mt20">
   <div class="f14">想了解更多图书</div>
   <div class="f18 mb10">进入论坛和书友交流吧！ </div>
   <div>进入：<a class="f16" href="message.jsp">talking@miao.com</a></div>
   
               </div>
            </div><!-- end .sidebar -->
            <div class="content">
            	<dl class="company_center_content">
                    <dt><h1><em></em><a href="order.jsp">订单查看-</a><em></em>  <a href="order1.jsp">待发货-</a> <a href="order2.jsp">待收货</a></h1></dt>
                 <dd>
       <%   session.getAttribute("phone"); 
            request.setCharacterEncoding("UTF-8");//传值编码
            response.setContentType("text/html;charset=UTF-8");
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");   
			String url="jdbc:sqlserver://localhost:1433;DatabaseName=Bookdb";
		    String  user="sa";
		    String pass="zhang";
		    int pagesize=5;  
            int pageCount; // 页数
            int curPage = 1;  //当前页
			Statement stmt=null;
	        Connection con=null;  
			con=DriverManager.getConnection(url,user,pass);  
			stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		    String sqls="select orderbasic.orderid,riqi,bookid,bookname,num,sums,zhuangtai   from orderbasic,orderdetails where orderbasic.orderid=orderdetails.orderid and tel='"+ session.getAttribute("phone")+"'and zhuangtai='已发货'";			
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
           <% if(size==0){ %>
     <table>
     <tr height="50">
     <td colspan="5" align="center">没有订单！</td>
     </tr>
     </table>
          <%}else{ %> 
    <table>
      <tr>
       <th>日期</th>
        <th>订单号</th>       
        <th>商品名称</th>
        <th>数量</th>
         <th>价格</th>
      
        <th>状态</th>
      </tr>      
         <%    do{ if(count>=pagesize)break;
               String orderid=rs.getString(1);
               String riqi=rs.getString(2);
               String bookid=rs.getString(3);
               String bookname=rs.getString(4);
               String num=rs.getString(5);
               String sums=rs.getString(6);
               String zhuangtai=rs.getString(7);
               count++; 
               %>
             <tr align="center">
             <td ><%=riqi%></td>
             <td><%=orderid%></td>
             <td ><%=bookname%></td>      
             <td ><%=num%></td>
             <td ><%=sums%></td>
             <td ><%=zhuangtai%></td>
          
             </tr>
               <% 
                }while(rs.next()); 
              
           %>
         </table>					
          
            <a href = "order2.jsp?curPage=1" >首页</a>  
            <a href = "order2.jsp?curPage=<%=curPage-1%>" >上一页</a>  
            <a href = "order2.jsp?curPage=<%=curPage+1%>" >下一页</a>  
            <a href = "order2.jsp?curPage=<%=pageCount%>" >尾页</a>  
                                 第<%=curPage%>页/共<%=pageCount%>页  
            <%}
              rs.close(); 
              con.close();  %> 
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