package model;
import java.io.Serializable;
public class OrderDetails   implements Serializable{
       private int itemID;
       private int orderID;
       private int bookID;
       private String bookName;
       private int quantity;
       private double unitCost;
       public int getItemID(){return itemID;}
   	   public void setItemID(int itemID){this.itemID=itemID;}
   	   public int getOrderID(){return orderID;}
 	   public void setOrderID(int orderID){this.orderID=orderID;}
 	   public int getbookID(){return bookID;}
	   public void setbookID(int bookID){this.bookID=bookID;}
	   public String getBookName(){return bookName;}
	   public void setBookName(String bookName){this.bookName=bookName;}
	   public int getQuantity(){return quantity;}
 	   public void setQuantity(int quantity){this.quantity=quantity;}
 	   public double getUnitCost(){return unitCost;}
	   public void setUnitCost(double unitCost){this.unitCost=unitCost;}
 	  
	   
}
