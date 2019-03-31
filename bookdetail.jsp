<%@ page language="java" import="java.util.*"import="java.sql.*" import ="java.util.ArrayList"  import="bean.Product" pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="bean.dbSQL" scope="page"/>
<jsp:useBean id="tool" class="bean.MyTools"scope="session"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书详情页</title>
    <meta content="no-siteapp" http-equiv="Cache-Control">
    <link  media="handheld" rel="alternate">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">	
	<link rel="Shortcut Icon" href="h/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="style/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="style/css/external.min.css"/>
    <link rel="stylesheet" type="text/css" href="style/css/popup.css"/>

<script type="text/javascript">
var youdao_conv_id = 271546; 
</script> 



<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js">
</script>
<script>
$(document).ready(function(){
//获得文本框对象
   var t = $("#text_box");
//初始化数量为1,并失效减
$('#min').attr('disabled',true);
    //数量增加操作
    $("#add").click(function(){    
        t.val(parseInt(t.val())+1)
        if (parseInt(t.val())!=1){
            $('#min').attr('disabled',false);
        }
      
    }) 
    //数量减少操作
    $("#min").click(function(){
        t.val(parseInt(t.val())-1);
        if (parseInt(t.val())==1){
            $('#min').attr('disabled',true);
        }
      
    })
   
});
</script>
</head>
<body background="style/pictures/2-2.jpg">
<%          
            session.getAttribute("phone");
            request.setCharacterEncoding("UTF-8");//传值编码
            response.setContentType("text/html;charset=UTF-8");
            String tel=request.getParameter("tel"); 
            String bookid=request.getParameter("bookid");                  
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");   
			String url="jdbc:sqlserver://localhost:1433;DatabaseName=Bookdb";
		    String  user="sa";
		    String pass="zhang";		   
			Statement stmt=null;
	        Connection con=null;  
			con=DriverManager.getConnection(url,user,pass);  
			stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			String sqls="select * from book where bookid='"+bookid+"'";			
			ResultSet rs=stmt.executeQuery(sqls);				
            while(rs.next())
            {  String bookname=rs.getString(1);
               String author=rs.getString(3);
               String date=rs.getString(4);
               String publisher=rs.getString(5);
               String pages=rs.getString(6);
               Float  price=rs.getFloat(7);
               int stock=rs.getInt(8);
               String image=rs.getString(9);  
               String cons=rs.getString(10);  
               String rec=rs.getString(12); 
                           
             
              
          %>            
          
 
<div id="header">
    	 <%@ include file="top.jsp" %>
       </div><!-- end #header -->

 <div id="container">    
        <div class="clearfix">       				
            <div class="content_l"> 
            <form method="post"action="accesscar.jsp?action=add&bookid=<%=bookid%>">          
	              <table border ="0" cellspacing=1 >
	              <tr>
	              <td width="250px" height="300px"align="center">
	              <img src="style/pictures/<%=image%>"width="200px" height="250px" alt="摆渡人">
	              </td>
	              <td>
	                 <table width="490px"border ="0" cellspacing=1 >
	                 <tr><h1> <%=bookname%></h1></tr>	                  	 
	                 <tr >
	                    <td width="190px" ><h2>作者：<%=author%></h2> </td>
	                    <td width="200px"><h2>出版社：<%=publisher%></h2> </td>
	                    <td width="90px"><h2>编号：<%=bookid%></h2> </td>	                    	                 
	                 </tr>
	                 <tr>
	                    <td><h2>出版日期：<%=date%></h2> </td>
	                    <td><h2>页数：<%=pages%></h2> </td>
	                    <td></td>
	                 </tr>	
	                 </table >  
	                 <table border =0 cellspacing=1>               
	                 <tr >
	                    <td width="60px"><h2>定价：</h2></td>
	                    <td width="130px"valign="middle"><h4>&yen;<%=price%></h4></td>
	                    <td><h2>库存：<%=stock%></h2> </td>
	                 </tr>
	                            
	                 </table>
	                 <table border ="0" cellspacing=1  width="490px">	
	                 <tr  width="490px">
	                    <td width="80px" valign="top"><h2>优惠活动：</h2>	</td>      
	                    <td width="300px"align="left"><h2>送 1440 积分，每 10 点积分可用于支付 0.01 元。
	                         2017开学购书满100元送礼券  2017开学购书满100元送礼券 
	                                                                           真实库存，24小时内发货！</h2>
	                    </td>           
	                 </tr>
	                 </table >
	                 <table border ="0" cellspacing=1  width="490px">	                 
	                 <tr  width="490px" >
	                    <td width="80px" valign="middle"> <h2>购买数量</h2></td>
	                    <td width="40px"valign="middle"> 
	                    <input id="min" name="" type="button" value="-"style=" font-size:20px;width:40px;height:30px;background-color:#91cebe;" />
	                    </td>
	                    <td  width="40px"valign="top">  
                        <input id="text_box" name="num" type="text" value="1"style="font-size:20px;width:20px;height:45px;background-color:#F0F0F0;"/>
                        </td>
                        <td  width="330px"valign="middle">  
                        <input id="add" name="" type="button" value="+" style=" font-size:20px;width:40px;height:30px;background-color:#91cebe;"/> 
                        </td>
	                 </tr>  
	                 </table>             
	              </td>
	              </tr>                                                        
	              </table> 
	            
	              <table>	          
	              <tr align="right" width="200px" >
	              <td width="246px"></td>
	              <td>
	              
	              <input type=submit value="加入购物车"style=" font-family:楷体;font-size:20px;width:100px;height:40px ;background-color:#91cebe;color:white;">
	             
	              <td>
	              </tr>
	              </table>	               	               	               	              	        	                              
                 </form>
                	<div class="c_breakline"></div>
               	
       				<div id="Profile">
			            <div class="profile_wrap">					            					          			            					          
					         <dl class="c_section" style="display: block;">
					             <dt>
					             <h2><em></em>内容提要</h2>
					            </dt>
					             <dd>
					                <div class="c_intro"><%=cons %></div>					                 
					            </dd>
					         </dl>
				        </div>
				    </div>
				     
			         <div class="profile_wrap" >					            					          			            					          
					         <dl class="c_section" style="display: block;">
					             <dt>
					                 <h2><em></em>编辑推荐语</h2>
					             <dt>
					             <dd>
					                <div class="c_intro"><%=rec %></div>					                 
					            </dd>
					         </dl>
				     </div><!-- end #Profile -->
				   </div> <!-- end #content-l -->      		     		
	         <div class="content_r">
	        
         <h6>热搜图书</h6>
         <table width:230px; align="center"; cellspacing=1 >
               <tr >
                 <td valign="top">
                 <a href="bookdetail.jsp?bookid=1160">
                  <img border="0"src="style/pictures/1-16.png"width="70px"height="100px" alt="乖，摸摸头" ></a>
                  </td>
                 <td  width:135px;>
                  <a href="bookdetail.jsp?bookid=11600"><h2>乖，摸摸头</h2></a><h3>&yen;14.80</h3>
                 </td>
               </tr>
               <tr >
                 <td valign="top">
                 <a href="bookdetail.jsp?bookid=1170">
                  <img border="0"src="style/pictures/1-17.png"width="70px"height="100px" alt="时间简史" ></a>
                  </td>
                 <td  width:135px;>
                  <a href="bookdetail.jsp?bookid=1170"><h2>时间简史（插图版）</h2></a><h3>&yen;14.80</h3>
                 </td>
               </tr>
               <tr >
                 <td valign="top">
                  <a href="bookdetail.jsp?bookid=1080">
                  <img border="0"src="style/pictures/1-8.jpg"width="70px"height="90px" alt="偷影子的人"></a>
                  </td>
                 <td  width:135px;>
                 <a href="bookdetail.jsp?bookid=1080">
                  <h2>偷影子的人</h2></a><h3>&yen;14.80</h3>
                 </td>
               </tr>
               <tr >
                 <td valign="top">
                 <a href="bookdetail.jsp?bookid=1010">
                  <img border="0"src="style/pictures/1-1.png"width="70px"height="100px" alt="白说"></a>
                  </td>
                 <td  width:135px;>
                  <a href="bookdetail.jsp?bookid=1010">
                  <h2>白说</h2></a><h3>&yen;14.80</h3>
                 </td>
               </tr>
               <tr >
                 <td valign="top">
                 <a href="bookdetail.jsp?bookid=1010">
                  <img border="0"src="style/pictures/1-1.png"width="70px"height="100px" alt="白说"></a>
                  </td>
                 <td  width:135px;>
                  <a href="bookdetail.jsp?bookid=1010">
                  <h2>白说</h2></a><h3>&yen;14.80</h3>
                 </td>
               </tr>
               <tr >
                 <td valign="top">
                 <a href="bookdetail.jsp?bookid=1010">
                  <img border="0"src="style/pictures/1-1.png"width="70px"height="100px" alt="白说"></a>
                  </td>
                 <td  width:135px;>
                  <a href="bookdetail.jsp?bookid=1010">
                  <h2>白说</h2></a><h3>&yen;14.80</h3>
                 </td>
               </tr>
               <tr >
                 <td valign="top">
                 <a href="bookdetail.jsp?bookid=1010">
                  <img border="0"src="style/pictures/1-1.png"width="70px"height="100px" alt="白说"></a>
                  </td>
                 <td  width:135px;>
                  <a href="bookdetail.jsp?bookid=1010">
                  <h2>白说</h2></a><h3>&yen;14.80</h3>
                 </td>
               </tr>                            
             </table>                
	         </div><!-- end #content_r --> 	     		
      </div><!-- end clearfix --> 
 
  <%  
            }  
           
           rs.close(); 
              con.close(); 

 %>

<!------------------------------------- end ----------------------------------------->


			<div class="clear"></div>
			<input type="hidden" value="af5b64a9520a4b7da6287ff3400dde11" id="resubmitToken">
	    	<a rel="nofollow" title="回到顶部" id="backtop" style="display: none;"></a>
	    </div><!-- end #container -->
	<!-- end #body -->
	<div id="footer">
		<div class="wrapper">
			<a rel="nofollow" target="_blank" href="about.html">联系我们</a>
		    <a target="_blank" href="http://www.lagou.com/af/zhaopin.html">互联网公司导航</a>
		    <a rel="nofollow" target="_blank" href="http://e.weibo.com/lagou720">拉勾微博</a>
		    <a rel="nofollow" href="javascript:void(0)" class="footer_qr">拉勾微信<i></i></a>
			<div class="copyright">&copy;2013-2014 Lagou <a href="http://www.miitbeian.gov.cn/state/outPortal/loginPortal.action" target="_blank">京ICP备14023790号-2</a></div>
		</div>
	</div>

</body>
</html>
