package global.sesoc.test.vo;

public class Book {
	private int booknum;		// 일련번호
	private String shelfname;	// 책장 이름
	private String userid;		// 유저 아이디
	private String btitle;		// 책 제목
	private String writer;		// 책 저자
	private String publisher;	// 출판사
	private String purchasedate;// 날짜
	private int price;			// 책 가격
	private String bookreview;	// 책 독서 평
	
	public Book() {
	}
	public int getBooknum() {
		return booknum;
	}
	public void setBooknum(int booknum) {
		this.booknum = booknum;
	}
	public String getShelfname() {
		return shelfname;
	}
	public void setShelfname(String shelfname) {
		this.shelfname = shelfname;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPurchasedate() {
		return purchasedate;
	}
	public void setPurchasedate(String purchasedate) {
		this.purchasedate = purchasedate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getBookreview() {
		return bookreview;
	}
	public void setBookreview(String bookreview) {
		this.bookreview = bookreview;
	}
	@Override
	public String toString() {
		return "Book [booknum=" + booknum + ", shelfname=" + shelfname + ", userid=" + userid + ", btitle=" + btitle
				+ ", writer=" + writer + ", publisher=" + publisher + ", purchasedate=" + purchasedate + ", price="
				+ price + ", bookreview=" + bookreview + "]";
	}
}
