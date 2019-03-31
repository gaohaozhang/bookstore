<%@ page language="java" import="java.util.*"import="java.sql.*" import ="java.util.ArrayList"  import="bean.Product" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb"><head>

<meta content="no-siteapp" http-equiv="Cache-Control">
<link  media="handheld" rel="alternate">
<!-- end 云适配 -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>购买成功</title>
<meta content="23635710066417756375" property="qc:admins">



<link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon">
<link href="style/css/style.css" type="text/css" rel="stylesheet">
<link href="style/css/external.min.css" type="text/css" rel="stylesheet">
<link href="style/css/popup.css" type="text/css" rel="stylesheet">

</head>
<body>
<%   
         session.getAttribute("phone");
         request.setCharacterEncoding("UTF-8");//传值编码
         response.setContentType("text/html;charset=UTF-8");
         String name=request.getParameter("name");
         String phone=request.getParameter("phone");
         String address=request.getParameter("address");
         String total=request.getParameter("total");
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");   
	     String url="jdbc:sqlserver://localhost:1433;DatabaseName=Bookdb";
		 String  user="sa";
		 String pass="zhang";		   
	     Statement stmt=null;
	     Connection con=null;  
	     con=DriverManager.getConnection(url,user,pass);  
	     stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
         //生成订单号
          String tel=(String)session.getAttribute("phone");
          String b=tel.substring(7,11);
          String datetime=new java.text.SimpleDateFormat("yyyyMMddhhmmss").format(Calendar.getInstance().getTime());
          String date=new java.text.SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());                
          String orderid=datetime+b; 
         //查询购物车表将里面信息，在循环插入明细表
         String sqls="select * from shopcar where tel='"+session.getAttribute("phone")+"'";			
	     ResultSet rs=stmt.executeQuery(sqls);
	     
	    while(rs.next()){       
	       String bookid1=rs.getString(2);  
	       String bookname1=rs.getString(3);  
	       int num1=rs.getInt(4);  
	       float sprice=rs.getFloat(5);  
	       Statement stmt1=null;
	       stmt1=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	       String sqli="insert into orderdetails values('"+orderid+"','"+bookid1+"','"+bookname1+"','"+num1+"','"+sprice+"')";  
	       stmt1.executeUpdate(sqli); 
	       	                
	     }//删除购物表里的,先插入订单总表，
	     String sqld="delete from shopcar where tel='"+tel+"'";           
           stmt.executeUpdate(sqld); 
         
         String sqli1="insert into orderbasic values('"+orderid+"','"+tel+"','"+date+"','"+name+"','"+phone+"','"+address+"','"+total+"','待发货')";  
	     stmt.executeUpdate(sqli1);	
	
 %>
<div id="body">
	<div id="header">
    		 <%@ include file="top.jsp" %>
    </div><!-- end #header -->
    <div id="container">        
        <div class="content_mid">
            <dl class="c_section c_section_mid">
        		<dt>
                    <h2><em></em>购买商品</h2>
                </dt>
                <dd class="c_notice"> 
                	<h4>恭喜你，你已经成功购买商品！</h4>
                    <a class="greylink" href="order.jsp">查询我的订单</a>
                    <a class="greylink" href="dreamcat.jsp"> 返回首页</a>
                </dd>
            </dl>
       	</div>
			<div class="clear"></div>
			
	    </div><!-- end #container -->
	</div><!-- end #body -->
	</body>
</html>
