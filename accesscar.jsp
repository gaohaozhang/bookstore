<%@ page language="java" import="java.util.*"import="java.sql.*" pageEncoding="UTF-8"%>
<jsp:useBean id="tool" class="bean.MyTools"scope="session"/>
<jsp:useBean id="car" class="bean.ShoppingCar"scope="session"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>购物车处理页</title>
</head>
<body>
<%          
            session.getAttribute("phone");
            request.setCharacterEncoding("UTF-8");//传值编码
            response.setContentType("text/html;charset=UTF-8");           
            String bookid=request.getParameter("bookid");
            String action=request.getParameter("action");          
            int num1=tool.strToint(request.getParameter("num"));                 
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");   
			String url="jdbc:sqlserver://localhost:1433;DatabaseName=Bookdb";
		    String  user="sa";
		    String pass="zhang";		   
			Statement stmt=null;
	        Connection con=null;  
			con=DriverManager.getConnection(url,user,pass);  
			stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
				
                                                  
           if(action==null)action="";
           if(action.equals("add")){//先查询是否加入过购物车
            String sqls="select * from shopcar where bookid='"+bookid+"'and tel='"+session.getAttribute("phone")+"'";                       		
			ResultSet rs=stmt.executeQuery(sqls);
           
            //如果查询为空则代表没有将该商品加入购物车
            if(!rs.next()){ //查询商品信息，插入购物车表 
            
               String sqls1="select * from book where bookid='"+bookid+"'";
               		
			   ResultSet rss=stmt.executeQuery(sqls1);
			   rss.next();
			   String bookname=rss.getString(1);            
               Float  price=rss.getFloat(7);
               int stock=rss.getInt(8);          
              if(num1<=stock){
                float sprice=price*num1;              
                String sqli="insert into shopcar values('"+session.getAttribute("phone")+"','"+bookid+"','"+bookname+"','"+num1+"','"+sprice+"')";           
                stmt.executeUpdate(sqli);		
                response.sendRedirect("showcar.jsp");
               }
            }
            //否则代表将该商品加入过 购物车，此时修改购物车表的信息，将数量加入
            else{ 
            int num0=rs.getInt(4);
            int num2=num0+num1 ;
            
            String sqlu="update shopcar set num='"+num2+"'";           
                stmt.executeUpdate(sqlu);		
                response.sendRedirect("showcar.jsp");
              
             
             }
           }
          else if(action.equals("remove")){
           
             
             String sqld="delete from shopcar where tel='"+session.getAttribute("phone")+"'and bookid='"+bookid+"' "; 
             stmt.executeUpdate(sqld);      
             response.sendRedirect("showcar.jsp");
           } 
           else if(action.equals("clear")){
              String sqld="delete from shopcar where tel='"+session.getAttribute("phone")+"'"; 
                stmt.executeUpdate(sqld);      
              response.sendRedirect("showcar.jsp");
           }        
        
          %>            
          
 

	            

</body>
</html>