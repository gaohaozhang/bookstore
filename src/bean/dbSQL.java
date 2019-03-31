package bean;
import java.sql.*;
public class dbSQL {
      Statement stmt=null;
      Connection con=null;
      public void getConnection()
      {
    	  wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwString JDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
    	  String conURL="jdbc:sqlserver://localhost:1433;DatabaseName=Bookdb";
    	  String  user="sa";
    	  String pass="zhang";
    	  try{
    		  Class.forName(JDriver);
    		  con=DriverManager.getConnection(conURL,user,pass); 
    	  }
    	  catch(Exception ex){
    		  System.err.println(ex.getMessage());
    	  }
    	  
      }
      public void executeUpdate(String sql)
      {
    	  try{
    		  stmt=con.createStatement();
    		  stmt.executeUpdate(sql);
    	  }
    	  catch(Exception ex){
    		  System.err.println(ex.getMessage());
    	  }
      }
      public ResultSet executeQuery(String sql)
      {   ResultSet rs=null; 	  
    	  try{
    		  stmt=con.createStatement();
    		  rs=stmt.executeQuery(sql);
    	  }
    	  catch(Exception ex){
    		  System.err.println(ex.getMessage());
    	  }
    	  return rs;
      }
      public void close()
      {
    	  try {
    		  stmt.close();
    		  con.close();
    	  }
    	  catch(SQLException ex)
    	  {
    		  System.err.println(ex.getMessage());
    	  }
      }
      
}



