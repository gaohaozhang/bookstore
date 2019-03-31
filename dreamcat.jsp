<%@ page language="java" import="java.util.*"  import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
<script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate" media="handheld"  />
<!-- end 云适配 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>萌猫网-好看的图书都在这里！</title>


<script type="text/javascript">
var ctx = "h";
console.log(1);
</script>
<link rel="Shortcut Icon" href="h/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="style/css/style.css"/>
<link rel="stylesheet" type="text/css" href="style/css/external.min.css"/>
<link rel="stylesheet" type="text/css" href="style/css/popup.css"/>


<script type="text/javascript">
var youdao_conv_id = 271546; 
</script> 
<script type="text/javascript" src="style/js/conv.js"></script>

</head>
<body background="style/pictures/2-2.jpg">
<div id="body">
<% 
    session.getAttribute("phone");

 %>
  <div id="header">
    	 <%@ include file="top.jsp" %>
       </div><!-- end #header -->
 
    <div id="container">
        				
		<div id="sidebar">
			<div class="mainNavs">
						
			<div class="menu_box">
					<div class="menu_main">
					<h2>经济管理 <span></span></h2>
						<a href="list.jsp?classify=市场营销">市场营销</a>
		                <a href="list.jsp?classify=经济学理论">经济学理论</a>
				        <a href="list.jsp?classify=国际贸易">国际贸易</a>
				        <a href="list.jsp?classify=物流管理">物流管理</a>
				        <a href="list.jsp?classify=管理学原理">管理学原理</a>
				        <a href="list.jsp?classify=财务管理">财务管理</a>
				        
				      </div>
				</div>		      				   					      		 
				<div class="menu_box">
					<div class="menu_main">
				     <h2>文学艺术 <span></span></h2>
					     <a href="list.jsp?classify=设计">设计</a>
				         <a href="list.jsp?classify=音乐">音乐</a>
				         <a href="list.jsp?classify=绘画涂鸦">绘画涂鸦</a>		
				         <a href="list.jsp?classify=青春文学">青春文学</a>
				         <a href="list.jsp?classify=外国文学">外国文学</a>
				         <a href="list.jsp?classify=人物传记">人物传记</a>
				         	
					</div>
				</div>
				<div class="menu_box">
					<div class="menu_main">				   		   			    
					<h2>人文社科 <span></span></h2>
					<a href="list.jsp?classify=数学">数学</a>
				    <a href="list.jsp?classify=英语">英语</a>
				    <a href="list.jsp?classify=化学">化学</a>
				    <a href="list.jsp?classify=日语">日语</a>
			        <a href="list.jsp?classify=生物">生物</a>
			        <a href="list.jsp?classify=物理">物理</a>
				    </div>
				</div>
				<div class="menu_box">
					<div class="menu_main">					  				
					<h2>科学技术 <span></span></h2>
					<a href="list.jsp?classify=语言与编程">语言与编程</a>
				    <a href="list.jsp?classify=电子通讯">电子通讯</a>
				    <a href="list.jsp?classify=电子电工">电工电子</a>
				    <a href="list.jsp?classify=数据库">数据库</a>
				    <a href="list.jsp?classify=建筑工程">建筑工程</a>
				    <a href="list.jsp?classify=土木工程">土木工程</a>
				  	</div>
				</div>	
				<div class="menu_box">
					<div class="menu_main">				   				
					<h2>生活休闲 <span></span></h2>
					<a href="list.jsp?classify=家庭保健">家庭保健</a>
				    <a href="list.jsp?classify=美食烹煮">美食烹煮</a>
			        <a href="list.jsp?classify=动漫卡通">动漫卡通</a>
				    <a href="list.jsp?classify=球类">球类</a>
				    <a href="list.jsp?classify=旅游必备">旅游必备</a>
				    </div>
				</div>	
				<div class="menu_box">
					<div class="menu_main">					  					   						
					<h2>教育考试 <span></span></h2>
					<a href="list.jsp?classify=教学理论">教学理论</a>
				    <a href="list.jsp?classify=研究生考试">研究生考试</a>
				    <a href="list.jsp?classify=考研英语">考研英语</a>
				    <a href="list.jsp?classify=公务员考试">公务员考试</a>
				   </div>
				</div>
		    </div>
							
<!-- 特价图书 --> <div class="subscribe" >           
             <h6>特价图书</h6>
             <table width:230px; align="center"; cellspacing=1 >
               <tr >
                 <td valign="top">
                 <a href="bookdetail.jsp?bookid=11600">
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
                  <a href="bookdetail.jsp?bookid=10800">
                  <img border="0"src="style/pictures/1-8.jpg"width="70px"height="90px" alt="偷影子的人"></a>
                  </td>
                 <td  width:135px;>
                 <a href="bookdetail.jsp?bookid=10800">
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
               
               
             </table>
            </div>		  
          </div><!-- sidebar end -->
		
		<!-- 中间部分 -->
        <div class="content">	
	        <div id="search_box">
		    <form id="searchForm" name="searchForm" action="search.jsp" method="get">
            <ul id="searchType">
        	        	<li data-searchtype="1" class="type_selected">书名</li>                       
            </ul>
        <div class="searchtype_arrow"></div>
        <input type="text" id="search_input" name ="name"  tabindex="1" value=""  placeholder="请输入职位名称，如：产品经理"  />
       
                <input type="submit" id="search_button" value="搜索" />				
           </form>
           </div>
<style>
.ui-autocomplete{width:488px;background:#fafafa !important;position: relative;z-index:10;border: 2px solid #91cebe;}
.ui-autocomplete-category{font-size:16px;color:#999;width:50px;position: absolute;z-index:11; right: 0px;/*top: 6px; */text-align:center;border-top: 1px dashed #e5e5e5;padding:5px 0;}
.ui-menu-item{ *width:439px;vertical-align: middle;position: relative;margin: 0px;margin-right: 50px !important;background:#fff;border-right: 1px dashed #ededed;}
.ui-menu-item a{display:block;overflow:hidden;}

</style>
<script type="text/javascript" src="style/js/search.min.js"></script>
      <dl class="hotSearch">
	<dt>热门搜索：</dt>
	<dd><a href="list.htmlJava?labelWords=label&city=">公务员考试</a></dd>
	<dd><a href="list.htmlPHP?labelWords=label&city=">四六级考试</a></dd>
	<dd><a href="list.htmlAndroid?labelWords=label&city=">英语</a></dd>
	
    </dl>			
			
<!-- 搜索框下图片 --><div id="home_banner">
	             <img  border="0" src="style/pictures/1-15.jpg">
	   
	                </div><!--/#main_banner-->
           
<!-- 推荐图书横栏 --><ul class="reset hotabbing">
            	      <li class="current">推荐图书</li>        	            
                    </ul>
              <!--一行四列 一格上面图书下面是书名和价格  -->
            <table  width="744px" align="right" bgColor="#F0F0F0" cellPadding=10 cellspacing=3 width="100%" border=0 >
             <tr>
              <td width="186px">
              <a href="bookdetail.jsp?bookid=1010">
              <img border="0"src="style/pictures/1-1.png"width="148px"height="180px"/></a><br>
              <a href="bookdetail.jsp?bookid=1160">
                    <h1> </a>白说&nbsp;&nbsp;央视著名主持人白岩松著</h1></a>
                                   <h2>白岩松</h2><h3>&yen;15.90</h3>                                     
              </td>
              <td width="186px">
              <a href="bookdetail.jsp?bookid=10200">
              <img border="0"src="style/pictures/1-2.jpg"width="148px"height="180px"/><br></a>
              <a href="bookdetail.jsp?bookid=10200">
                                  <h1>狼图腾</h1></a>
                                   <h2>姜戎</h2><h3>&yen;15.90</h3> 
              </td>
              <td width="186px">
              <a href="bookdetail.jsp?bookid=10400">
              <img border="0"src="style/pictures/1-4.png"width="148px"height="180px"/><br></a>
               <a href="bookdetail.jsp?bookid=10400"> 
                                  <h1>萤火虫小巷</h1></a>
                                   <h2>克里斯汀·汉娜</h2><h3>&yen;15.90</h3>
              </td>
              <td width="186px">
              <a href="bookdetail.jsp?bookid=10600">
              <img border="0"src="style/pictures/1-6.jpg"width="148px"height="180px"/><br></a>
              <a href="bookdetail.jsp?bookid=10600">    
                                  <h1>平凡的世界</h1></a>
                                   <h2>路遥</h2><h3>&yen;31.90</h3>
              </td>
            </tr>
            
            <tr>
              <td width="186px">
              <a href="bookdetail.jsp?bookid=1070">
              <img border="0"src="style/pictures/1-7.png"width="148px"height="180px"/><br></a>
               <a href="bookdetail.jsp?bookid=1070">
               <h1>将来的你.一定会感谢现在拼命的自己</h1></a><h2>汤木</h2><h3>&yen;12.80</h3>                                     
              </td>
              <td width="186px">
              <a href="bookdetail.jsp?bookid=10800">
              <img border="0"src="style/pictures/1-8.jpg"width="148px"height="180px"><br></a>
              <a href="bookdetail.jsp?bookid=10800">
                                   <h1>偷影子的人</h1></a><h2>[法] 马克·李维</h2><h3>&yen;11.90</h3> 
              </td>
              <td width="186px">
              <a href="bookdetail.jsp?bookid=11100">
              <img border="0"src="style/pictures/1-11.jpg"width="148px"height="180px"/><br></a>
              <a href="bookdetail.jsp?bookid=11100">
                                   <h1>摆渡人</h1></a>
                                   <h2>百花洲文艺出版社</h2><h3>&yen;15.90</h3>
              </td>
              <td width="186px">
               <a href="bookdetail.jsp?bookid=1130">
              <img border="0"src="style/pictures/1-13.png"width="148px"height="180px"/><br></a>
               <a href="bookdetail.jsp?bookid=1130">
                                   <h1>边城</h1></a>
                                   <h2>沈从文</h2><h3>&yen;22.80</h3>
              </td>
            </tr>           
            </table>
              
            <div class="clear"></div>
		
        </div>	
        <div class="second">
         <table align="center">
         <tr>
         <td><img src="style/pictures/1-12.png" weight="400px"height="120px"></td>
         <td><img src="style/pictures/1-15.jpg" weight="400px"height="120px"></td>
         <td><img src="style/pictures/1-5.jpg" weight="400px"height="120px"></td>
         </tr>
         </table>
         </div>
         <br>
         <div class="tuijian">      
       <ul class="reset hotabbing">
           <li class="current">新书热推</li>        	            
       </ul>
        <table  width="744px" align="center" bgColor="#F0F0F0" cellPadding=10 cellspacing=3 width="100%" border=0 >
        <tr>
        <td width="186px">
              <a href="bookdetail.jsp?bookid=1010">
              <img border="0"src="style/pictures/1-1.png"width="148px"height="180px"/></a><br>
              <a href="bookdetail.jsp?bookid=1160">
                    <h1></a>白说&nbsp;&nbsp;央视著名主持人白岩松著</h1></a><h2>白岩松</h2><h3>&yen;15.90</h3>                                     
        </td>
        <td width="186px">
              <a href="bookdetail.jsp?bookid=1010">
              <img border="0"src="style/pictures/1-1.png"width="148px"height="180px"/></a><br>
              <a href="bookdetail.jsp?bookid=1160">
                    <h1></a>白说&nbsp;&nbsp;央视著名主持人白岩松著</h1></a><h2>白岩松</h2><h3>&yen;15.90</h3> 
        </td>         
        <td width="186px">
              <a href="bookdetail.jsp?bookid=1010">
              <img border="0"src="style/pictures/1-1.png"width="148px"height="180px"/></a><br>
              <a href="bookdetail.jsp?bookid=1160">
                    <h1> </a>白说&nbsp;&nbsp;央视著名主持人白岩松著</h1></a><h2>白岩松</h2><h3>&yen;15.90</h3> 
        </td>
        <td width="186px">
              <a href="bookdetail.jsp?bookid=1010">
              <img border="0"src="style/pictures/1-1.png"width="148px"height="180px"/></a><br>
              <a href="bookdetail.jsp?bookid=1160">
                    <h1> </a>白说&nbsp;&nbsp;央视著名主持人白岩松著</h1></a><h2>白岩松</h2><h3>&yen;15.90</h3> 
           </td>                                                                              
        </tr>
        <tr>
        <td width="186px">
              <a href="bookdetail.jsp?bookid=1010">
              <img border="0"src="style/pictures/1-1.png"width="148px"height="180px"/></a><br>
              <a href="bookdetail.jsp?bookid=1160">
                    <h1> </a>白说&nbsp;&nbsp;央视著名主持人白岩松著</h1></a>
                                   <h2>白岩松</h2><h3>&yen;15.90</h3>                                     
             
        </td>
        <td width="186px">
              <a href="bookdetail.jsp?bookid=1010">
              <img border="0"src="style/pictures/1-1.png"width="148px"height="180px"/></a><br>
              <a href="bookdetail.jsp?bookid=1160">
                    <h1> </a>白说&nbsp;&nbsp;央视著名主持人白岩松著</h1></a>
                                   <h2>白岩松</h2><h3>&yen;15.90</h3>                                     
             
        </td>
        <td width="186px">
              <a href="bookdetail.jsp?bookid=1010">
              <img border="0"src="style/pictures/1-1.png"width="148px"height="180px"/></a><br>
              <a href="bookdetail.jsp?bookid=1160">
                    <h1> </a>白说&nbsp;&nbsp;央视著名主持人白岩松著</h1></a>
                                   <h2>白岩松</h2><h3>&yen;15.90</h3>                                     
             
        </td>
        <td width="186px">
              <a href="bookdetail.jsp?bookid=1010">
              <img border="0"src="style/pictures/1-1.png"width="148px"height="180px"/></a><br>
              <a href="bookdetail.jsp?bookid=1160">
              <h1> </a>白说&nbsp;&nbsp;央视著名主持人白岩松著</h1></a>
                                   <h2>白岩松</h2><h3>&yen;15.90</h3>                                     
             
        </td>
        </tr>
        </table>
        
        
        </div>
        <div class="resou">
         <h6>热搜图书</h6>
         <table width:230px; align="center"; cellspacing=1 >
               <tr >
                 <td valign="top">
                 <a href="bookdetail.jsp?bookid=1160">
                  <img border="0"src="style/pictures/1-16.png"width="70px"height="100px" alt="乖，摸摸头" ></a>
                  </td>
                 <td  width:135px;>
                  <a href="bookdetail.jsp?bookid=1160"><h2>乖，摸摸头</h2></a><h3>&yen;14.80</h3>
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
        
        </div>

 	
			<div class="clear"></div>
			<input type="hidden" id="resubmitToken" value="" />
	    	<a id="backtop" title="回到顶部" rel="nofollow"></a>
	  </div> <!-- end #container -->
	
<!-- 网站底部 -->	<div id="footer">
	            <%@ include file="footer.jsp" %>   
        </div>  <!-- end footer -->
  
	</div><!-- end  body-->



</body>
</html>			