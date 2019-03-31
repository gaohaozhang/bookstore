<%@ page language="java" import="java.util.*"import="java.sql.*" import ="java.util.ArrayList"  import="bean.Product" pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="bean.dbSQL" scope="page"/>
<jsp:useBean id="tool" class="bean.MyTools"scope="session"/>
<jsp:useBean id="car" class="bean.ShoppingCar"scope="session"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>购物车</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <link rel="stylesheet" href="style/css/css1/style.css"/>
  </head>
  
  <body background="style/pictures/2-2.jpg">
  <script type="text/javascript">
 function checkUser(action){
    form1.action=action;
    form1.submit();
  }
function checktel(){
     var t=document.form1.phone.value;
     var len=t.length;  
      if(len!=11){
      alert('请输入11位有效手机号码');}
      if( t== "")      { 
      document.getElementById("p").value="手机号码不能为空";      
      document.form1.phone.focus();     
      return false;      }           
      var strP=/^\d+$/;    //判断是否为数字的表达式      
      if(!strP.test(t))      {     
      document.getElementById("p").value="手机号码非数字格式";         
        document.form1.phone.focus();          
       return false;      }
}
function check(){
     var adr=document.form1.address.value;   
      if( adr== "")      {     
      alert('请输入有效信息'); 
      return false;      }           
      var name=document.form1.name.value;   
      if( name== "")      {     
      alert('请输入有效信息'); 
      return false;      }   
}
function checka(){
     var adr=document.form1.address.value;   
      if( adr== "")      {     
      alert('请输入有效信息'); 
      return false;      }           
      var name=document.form1.name.value;   
      if( name== "")      {     
      alert('请输入有效信息'); 
      return false;      }   
}
     
</script>
   <%    request.setCharacterEncoding("UTF-8");//传值编码
         response.setContentType("text/html;charset=UTF-8");
         session.getAttribute("phone");
         float total=0;
         
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");   
			String url="jdbc:sqlserver://localhost:1433;DatabaseName=Bookdb";
		    String  user="sa";
		    String pass="zhang";		   
			Statement stmt=null;
	        Connection con=null;  
			con=DriverManager.getConnection(url,user,pass);  
			stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			String sqls="select * from shopcar where tel='"+session.getAttribute("phone")+"'";			
			ResultSet rs=stmt.executeQuery(sqls);
			rs.last();  
            int size = rs.getRow();      	
          
   
    %>
   
<div id="body">
<div id="header">
    	 <%@ include file="top.jsp" %>
       </div><!-- end #header -->
    <div class="catbox">
 
  <table id="cartTable">
    <thead>
      <tr>
       <th>商品号</th>
        <th>商品</th>       
        <th>数量</th>
        <th>小计</th>
        <th>操作</th>
      </tr>
    </thead>
    <% if(size==0){ %>
     <tbody>
     <tr height="50">
     <td colspan="5" align="center">您的购物车为空！</td>
     </tr>
     </tbody>
     <%   } 
     else{  rs.beforeFirst();   
        while(rs.next()){
            String bookid=rs.getString(2);
            String bookname=rs.getString(3);            
            int num=rs.getInt(4); 
            Float  sprice=rs.getFloat(5);   
            total+=sprice;
             
           %>
           
        <tr align="center">
        <td class="id"><%=bookid%></td>
        <td class="goods"><%=bookname%></td>      
        <td class="count"><%=num%></td>
        <td class="subtotal"><%=sprice%></td>
        <td class="operation"><span class="delete"><a href="accesscar.jsp?action=remove&bookid=<%=bookid%>&">移除</a></span></td>
        </tr>
         
         <%  }
           }   
           %>
         </table>
        <div>
          <form  name="form1" method="post" action="success.jsp?total=<%=total%>">
              <div class="foot" id="foot">   
           <a class="fl delete" id="deleteAll"  href="dreamcat.jsp">继续购物</a>
           <a class="fl delete" id="deleteAll"  href="accesscar.jsp?action=clear">清空购物车</a>
           <div class="fr closing" ><input name="sub" style="height:40px;background-color:#eaeaea;" type=submit value="结 算"></div>
           <input type="hidden" id="cartTotalPrice" />
           <div class="fr total">应付金额:<%=total%></div>
           <div class="selected-view"><span class="arrow">◆<span>◆</span></span> </div>
              </div>
     
           <li>收件人：<input name="name" id="n"type="text" onChange="return check();" style="height:12px;background-color:#eaeaea;"></li>
           <li>
                              联系方式：<input  type="text"name="phone"id="p" onChange="return checktel();"style="height:12px;background-color:#eaeaea;"></li> 
           <li>
                            地址：<input type="text" name="address"id="adr"  onChange="return checka();"style="height:12px;background-color:#eaeaea;" ></li>                
          </form>
      </div>
          
      
</div>
</div>
</body>
</html>