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
            String classify="";       
            classify=new String(request.getParameter("classify").getBytes("ISO-8859-1"),"utf-8");
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
			String sqls="select * from book where classify='"+classify+"'";			
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
     <%@ include file="classify.jsp" %>
        <div class="content" >        
        <div id="search_box">
		    <form id="searchForm" name="searchForm" action="search.jsp" method="get">
            <ul id="searchType">
        	        	<li data-searchtype="1" class="type_selected">书名</li>                       
            </ul>
               <div class="searchtype_arrow"></div>
                <input type="text"  id="search_input" name ="name" tabindex="1" value=""/>      
                <input type="submit" id="search_button"  value="搜索" />				
           </form>
           </div> 
           
        <%--end search_box--%> 
                    
         
                    <ul class="reset hotabbing">
            	      <li class="current"><%=classify%></li> <li class="h0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共有图书<%=size %>种</li>     	            
                    </ul>
      <div class="listbook">
            <!--展示图书  -->
      <table  class="listtable" width="744px" align="right" bgColor="#F0F0F0" cellPadding=5 cellspacing=1 border=0 >
      <% if(classify!=""){
      
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
              <td width="150px" >
               <a href="bookdetail.jsp?bookid=<%=bookid%>">
               <img border="0"src="style/pictures/<%=image%>"width="124px"height="165px"/></a>                                               
              </td>
             <td>
               <table width="558px" >
                 <tr><a href="bookdetail.jsp?bookid=<%=bookid%>"> <h1><%=bookname%></h1></a></tr>
                 <tr><hl class=hfont> <%=author %>/<%=date %>/<%=publisher %>/<%=pages %></hl></tr>
                 <tr width="558px"><p class="p"><%=cons%></p></tr>
                 <tr><h3>&yen;<%=price%></h3></tr>
                </table>
             </td>
            </tr>           
           
          <%}while(rs.next()); 
         %>
              </table> 
          </div> 
        
            <a href = "list.jsp?curPage=1&classify=<%=classify%>" >首页</a>  
            <a href = "list.jsp?curPage=<%=curPage-1%>&classify=<%=classify%>" >上一页</a>  
            <a href = "list.jsp?curPage=<%=curPage+1%>&classify=<%=classify%>" >下一页</a>  
            <a href = "list.jsp?curPage=<%=pageCount%>&classify=<%=classify%>" >尾页</a>  
                                 第<%=curPage%>页/共<%=pageCount%>页  
            <% }
              classify="";
              rs.close(); 
              con.close();  %> 
        </div><%--end content--%>
    </div><%--end container --%>
    <div id="footer">
	<%@ include file="footer.jsp" %>   
        </div>
       
    <!-- end footer -->
   
  </body>
</html>
