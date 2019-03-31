package bean;

public class Product {
	public Product(){}
	private String id;
	private String name;
	private float price;
	private int num;
	public String getId(){return id;}
	public void setId(String id){this.id=id;}
	public String getName(){return name;}
	public void setName(String name){this.name=name;}
	public float getPrice(){return price;}
	public void setPrice(float price){this.price=price;}
	public int getNum(){return num;}
	public void setNum(int num){this.num=num;}
}
