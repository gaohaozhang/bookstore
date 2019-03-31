package model;
import java.io.Serializable;
import java.util.Date;
public class Book implements Serializable{
       private int bookID;
       private String name;
       private String description;
       private String author;
       private String publisher;
       private Date publishDate;
       private int pageCount;
       private double price ;
       private String image;
       private String thumbnail;
      
       public int getBookID(){return bookID;}
   	   public void setBookID(int bookID){this.bookID=bookID;}
   	  
 	    public String getName(){return name;}
 		public void setName(String name){this.name=name;}
 		
 		public String getDescription(){return description;}
  		public void setDescription(String description){this.description=description;}
  		 
  		public String getAuthor(){return author;}
  		public void setAuthor(String author){this.author=author;}
  	
  		public String getPublisher(){return publisher;}
  		public void setPublisher(String publisher){this.publisher=publisher;}
  		
  		public Date getPublishDate(){return publishDate;}
  		public void setPublishDate( Date PublishDate){this.publishDate=publishDate;}
  		
        public int getPageCount(){return pageCount;}
 		public void setpageCount(int pageCount){this.pageCount=pageCount;}
 		
 		public double getPrice(){return price;}
 		public void setPrice(double price){this.price=price;}
 		
 		public String getImage(){return image;}
  		public void setImage(String image){this.image=image;}
  		
  		public String getThumbnail(){return thumbnail;}
  		public void setThumbnail(String thumbnail){this.thumbnail=thumbnail;}
  		
  		
       
}
