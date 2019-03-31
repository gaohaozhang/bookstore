<%@ page language="java" import="java.util.*" import="java.sql.*"pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 
<html>  
    <head>  
      <title>hello</title>  
    </head>  
    <body>  
  <table border="1" spacing="2">  
  <%!  
 
    public static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";  
    public static final String USER = "sa";  
    public static final String PASS = "zhang";  
    public static final String URL = "jdbc:sqlserver://localhost:1433;DatabaseName=Bookdb";  
    public static final int pagesize= 5;  
   int pageCount; // 页数
  int curPage = 1;  //当前页
%>  
<%  
   //一页放5个  
    String user = null;  
    String pass = null;  
   try{  
       Class.forName(DRIVER);       
       Statement stmt=null;
	   Connection con=null;  
		con=DriverManager.getConnection(URL,USER,PASS);  
		stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		String sql = "SELECT * FROM login"; 		
		ResultSet rs=stmt.executeQuery(sql);						                  
       rs.last();  
       int size = rs.getRow(); 
       //    out.println(size+"ddddddddddd"); 
       pageCount = (size%pagesize==0)?(size/pagesize):(size/pagesize+1);  
       String tmp = request.getParameter("curPage");  
       if(tmp==null){  
           tmp="1";  
       }  
       curPage = Integer.parseInt(tmp);  
       if(curPage>=pageCount) curPage = pageCount;  
       boolean flag = rs.absolute((curPage-1)*pagesize+1);  
       out.println(curPage);  
       int count = 0;  
          do{    if(count>=pagesize)break;
          String name= rs.getString(1);  
           String psw = rs.getString(2);  
         
            count++;  
%>  
        <tr>  
            <td><%=name%></td>  
            <td><%=psw%></td>  
           
        </tr>  
            <%  
        }while(rs.next());  
        con.close();  
    }  
    catch(Exception e){  
          
    }  
%>  
</table>  
<a href = "MyJsp2.jsp?curPage=1" >首页</a>  
<a href = "MyJsp2.jsp?curPage=<%=curPage-1%>" >上一页</a>  
<a href = "MyJsp2.jsp?curPage=<%=curPage+1%>" >下一页</a>  
<a href = "MyJsp2.jsp?curPage=<%=pageCount%>" >尾页</a>  
第<%=curPage%>页/共<%=pageCount%>页  
  
</body>  
</html>  
