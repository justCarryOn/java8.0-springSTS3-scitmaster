package global.sesoc.test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.test.vo.Book;
import global.sesoc.test.vo.Member;

@Repository
public class BookRepository {
	@Autowired
	SqlSession session;


	public List<Book> readingList() {
		BookMapper mapper = session.getMapper(BookMapper.class);
		List<Book> bookList = mapper.selectAll(null);
		
		return bookList;
	}


	public int insertReview(Book book) {
		BookMapper mapper = session.getMapper(BookMapper.class);
		int result = mapper.insertReview(book);
		
		return result;
	}


	public int deleteReview(int booknum) {
		BookMapper mapper = session.getMapper(BookMapper.class);
		int result = mapper.deleteReview(booknum);
		
		return result;
		
	}

	public List<Book> searchShelf(Book book) {
		BookMapper mapper = session.getMapper(BookMapper.class);

		if(book.getShelfname().equals("전체")) 
		book = null;
		List<Book> bookList = mapper.selectAll(book);
		return bookList;
	}


	public Book searchBook(int booknum) {
		BookMapper mapper = session.getMapper(BookMapper.class);
		
		Book book = mapper.searchBook(booknum);
		return book;
	}

	// 독서노트 수정 처리
	public int updateReview(Book book) {
		BookMapper mapper = session.getMapper(BookMapper.class);
		
		int result = mapper.updateBook(book);
		return result;
		
	}

}







