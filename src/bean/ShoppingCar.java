package bean;
import java.util.ArrayList;
public class ShoppingCar {
       private ArrayList buylist=new ArrayList();
       public ArrayList getBuylist(){
    	   return buylist;
    	  
       }
       //����Ʒ��ӵ����ﳵ��
       public void addItem(Product product){
    	   if(product!=null){
    		   int i=0;
    		   //����buylist�ļ��Ͷ����жϸü������Ƿ��Ѿ����ڵ�ǰҪ��ӵ���Ʒ
    		   for(;i<buylist.size();i++){
    			   //��ȡ�����еĵ�ǰԪ�أ�����temp��
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
