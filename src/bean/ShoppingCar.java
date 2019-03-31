package bean;
import java.util.ArrayList;
public class ShoppingCar {
       private ArrayList buylist=new ArrayList();
       public ArrayList getBuylist(){
    	   return buylist;
    	  
       }
       //将商品添加到购物车中
       public void addItem(Product product){
    	   if(product!=null){
    		   int i=0;
    		   //遍历buylist的集和对象，判断该集和中是否已经存在当前要添加的商品
    		   for(;i<buylist.size();i++){
    			   //获取集和中的当前元素，存在temp中
    			   Product temp=(Product)buylist.get(i);
    			   if(temp.getName().equals(product.getName())){
    				   temp.setName(temp.getName()+1);
    				   break;
    				   
    			   }
    		   }
    		   if(i==buylist.size()){
    			   buylist.add(product);
    		   }
    	   }
       }
         
       public void removeItem(String id){
    	  
    	   
    	   for(int i=0;i<buylist.size();i++){
    		   Product temp=(Product)buylist.get(i);
    		   if(temp.getId().equals(id)){
    			   
    			   buylist.remove(i);
				   break;
    			   
    			   /*if(temp.getNum()==0){
    				   buylist.remove(i);
    				   //temp.setNum(temp.getNum()-1);
    				   break;
    			   }
    			  else if(temp.getNum()==1){
    				   buylist.remove(i);
    				   break;
    			   }*/
    					  
    		   }
    	   }
       }
       public void clearCar(){
    	   buylist.clear();
       }
       
       
}
