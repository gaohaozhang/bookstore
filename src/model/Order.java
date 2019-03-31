package model;
import java.io.Serializable;
import java.util.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
public class Order  implements Serializable{
	private int orderID;
	private int customerID;
    private String name;
    private String address;
    private String phone;
    private Date createdOn;
    private int status;
    private double totalAmount;
    List<OrderDetails> orders=new ArrayList<OrderDetails>();
    public Order(){
    	status=1;
    	totalAmount=0.0;
    }
    public void addOrderDetails(OrderDetails od){
    	orders.add(od);
    	totalAmount=totalAmount+od.getQuantity()*od.getUnitCost();
    }
    public List<OrderDetails> getOrders() {
    	return orders;   	
    }
    public double getTotalAmount(){return totalAmount;}
    public void setTotalAmount(double amount){totalAmount=amount;}
    
    public int getOrderID(){return orderID;}
    public void setOrderID(int orderID){
    	this. orderID= orderID;
    	Iterator<OrderDetails> it=orders.iterator();
    	while(it.hasNext()){
    		OrderDetails od=it.next();
    		od.setOrderID(orderID);
    	}
    }
    public int getCustomerID(){return customerID;}
	public void setCustomerID(int customerID){this.customerID=customerID;}
	public String getName(){return name;}
	public void setName(String name){this.name=name;}
	public String getAddress(){return address;}
	public void setAddress(String address){this.address=address;}
	public String getPhone(){return phone;}
	public void setPhone(String phone){this.phone=phone;}
	public int getStatus(){return status;}
	public void setStatus(int status){this.status=status;}
	
}
