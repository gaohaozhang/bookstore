<%@ page language="java" import="java.util.*"import="java.sql.*" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
  <base href="<%=basePath%>">
<script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate" media="handheld"  />

<!-- end 云适配 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>分类搜索</title>

<!-- <div class="web_root"  style="display:none">h</div> -->
<script type="text/javascript">
var ctx = "h";
console.log(1);
</script>
<link rel="Shortcut Icon" href="h/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="style/css/style.css"/>
<link rel="stylesheet" type="text/css" href="style/css/external.min.css"/>
<link rel="stylesheet" type="text/css" href="style/css/popup.css"/>
<script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
<script src="style/js/ajaxfileupload.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/additional-methods.js"></script>

<script type="text/javascript">
var youdao_conv_id = 271546; 
</script> 
<script type="text/javascript" src="style/js/conv.js"></script>
</head>
  

 <body background="style/pictures/2-2.jpg">
 <%  
            request.setCharacterEncoding("UTF-8");//传值编码
            response.setContentType("text/html;charset=UTF-8");
            String name="";       
            name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8");
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");   
			String url="jdbc:sqlserver://localhost:1433;DatabaseName=Bookdb";
		    String  user="sa";
		    String pass="zhang";
		    int pagesize= 5;  
            int pageCount; // 页数
            int curPage = 1;  //当前页
			Statement stmt=null;
	        Connection con=null;  
			con=DriverManager.getConnection(url,user,pass);  
			stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			String sqls="select * from book where bookname like '%"+name+"%'";			
			ResultSet rs=stmt.executeQuery(sqls);
			 rs.last();  
            int size = rs.getRow();       
            pageCount = (size%pagesize==0)?(size/pagesize):(size/pagesize+1);  
            String tmp = request.getParameter("curPage");  
            if(tmp==null){  
               tmp="1";  }  
            curPage = Integer.parseInt(tmp);  
           if(curPage>=pageCount) curPage = pageCount;  
           boolean flag = rs.absolute((curPage-1)*pagesize+1);          
           int count = 0;  
          
			%>			
                   
<div id="header">
<%@ include file="top.jsp" %>   	   	
    </div><!-- end #header -->
    
    <div id="container">
     
        <div class="content" >    
      
           <div id="search_box">
		    <form id="searchForm" name="searchForm" action="search.jsp" method="get">
            <ul id="searchType">
        	        	<li data-searchtype="1" class="type_selected">书名</li>                       
            </ul>
               <div class="searchtype_arrow"></div>
                <input type="text"  id="search_input" name = "kd"  tabindex="1" value=""    />      
                <input type="submit" id="search_button"  value="搜索" />				
           </form>
           </div> 
           
        <%--end search_box--%> 
                    
           </div> <%--end content--%> 
     <div class="ssbook">
     
       <ul class="reset hotabbing">
            <li class="current">搜索</li>        	            
       </ul>
   
            <!--展示图书  -->
      <table  width="1024px" align="left"  bgColor="#F0F0F0" cellPadding=10 cellspacing=3  border=0 >
     <% if(name!=""){
      
       do{ if(count>=pagesize)break;
               String bookname=rs.getString(1);
               String bookid=rs.getString(2);
               String author=rs.getString(3);
               String date=rs.getString(4);
               String publisher=rs.getString(5);
               String pages=rs.getString(6);
               String price=rs.getString(7);
               String image=rs.getString(9);
               String cons=rs.getString(10); 
               count++;  
             %>
              
           <tr>
              <td width="186px">
               <a href="bookdetail.jsp?bookid=<%=bookid%>">
               <img border="0"src="style/pictures/<%=image%>"width="124px"height="165px"/></a>                                               
              </td>
             <td>
               <table width="558px" >
                 <tr><a href="bookdetail.jsp?bookid=<%=bookid%>"> <h1><%=bookname%></h1></a></tr>
                 <tr><h4l> <%=author %>/<%=date %>/<%=publisher %>/<%=pages %></h4l></tr>
                 <tr width="186px"><p class="p"><h1l><%=cons%></h1l></p></tr>
                 <tr><h3>&yen;<%=price%></h3></tr>
                </table>
             </td>
            </tr>           
              
         <%}while(rs.next()); 
         %>
         
             </table> 
            
          </div> 
         <div>
             <a href = "search.jsp?curPage=1&name=<%=name%>" >首页</a>  
            <a href = "search.jsp?curPage=<%=curPage-1%>&name=<%=name%>" >上一页</a>  
            <a href = "search.jsp?curPage=<%=curPage+1%>&name=<%=name%>" >下一页</a>  
            <a href = "search.jsp?curPage=<%=pageCount%>&name=<%=name%>" >尾页</a>  
                                 第<%=curPage%>页/共<%=pageCount%>页  
            <% }
              name="";
              rs.close(); 
              con.close();  %> 
          
     
    </div><%--end container --%>
  </body>
</html>
