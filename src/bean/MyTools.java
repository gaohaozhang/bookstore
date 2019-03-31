package bean;

public class MyTools {
   public static int strToint(String str){//将String转化为int
	   if(str==null||str.equals(""))
	   str="0";
	   int i=0;
	   try{i=Integer.parseInt(str);}
	   catch(Exception e){
		   System.out.println(e.getMessage());
	   }
	   return i;
   }
   public static String toChinese(String str){
       if(str==null)str="";
       try{
    	   byte a[]=str.getBytes("IOS-8859-1");
    	   str=new String(a);
       }
       catch(Exception e){
    	   System.out.println(e.getMessage());
    	   
       }
       return str;
   }
}
