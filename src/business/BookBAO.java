package business;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.birt.data.engine.odaconsumer.ConnectionManager;

import model.Book;
import util.BookShopConfig;

public class BookBAO {
	public int HowManyPages=0;
	public List<Book> getBooksOnCatalog(int pageNo){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int nStartItem=0;
		List<Book> bookList=new ArrayList<Book>;
		try{
			con=ConnectionManager.getConnection();
			CallableStatement call=con.prepareCall("call CountBooksOnCatalog()}");
			rs.call.execteQuery();
			rs.next();
			int bookCount=rs.getInt(1);
			if(bookCount==0){
				 HowManyPages=0;
				 return bookList;
				 
			}
			HowManyPages=(bookCount+BookShopConfig.BOOK_PER_PAGE-1)/BookShopConfig.BOOK_PER_PAGE;
			nStartItem=(pageOn-1)*BookShopConfig.BOOK_PER_PAGE;
			call=con.prepareCall("{callCountBooksOnCatalog(?,?,?)}");
			call.setInt(1, BookShopConfig.DESCRIPTION_LEN);
			call.setInt(2, BookShopConfig.BOOK_PER_PAGE);
			call.setInt(3, BookShopConfig.nStartItem);
			rs=call.executeQuery();
			while(rs.next()){
				Book book=new Book();
				book.setBookID(rs.getInt("book_id"));
				book.setName(rs.getString("name"));
				book.setDescription(rs.getString("description"));
				book.setAuthor(rs.getString("author"));
				book.setPrice(rs.getDouble("price"));
				book.setThumbnail(rs.getString("thumbnail"));
				bookList.add(book);
					
			}
		}
		catch(SQLException exception)
		{
			exception.printStackTrace();
		}
		finally{
			ConnectionManager.closeResultSet(rs);
			ConnectionManager.closeStatement(pstmt);
			ConnectionManager.closeConnection(con);
		}
	}

}
