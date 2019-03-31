package model;
import java.io.Serializable;
public class CartItemBean implements Serializable{
    private Book book;
	
	private int quantity;
	
	public Book getBook(){
		return book;
	}
	
	public int getQuantity(){
		return quantity;
	}
	public void setQuantity(int number){
		this.quantity=number;
	}
}
