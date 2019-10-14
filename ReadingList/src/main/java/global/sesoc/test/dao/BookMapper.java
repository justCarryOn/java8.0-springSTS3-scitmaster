package global.sesoc.test.dao;

import java.util.List;
import global.sesoc.test.vo.Book;

public interface BookMapper {
	public List<Book> selectAll(Book book);
	public int insertReview(Book book);
	public Book selectOne(int booknum);
	public int deleteReview(int booknum);
	public Book searchBook(int booknum);
	public int updateBook(Book book);
}
