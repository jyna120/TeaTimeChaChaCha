package package_db;

public class ReviewBean {
	private int review_id; 
	private String review_title; 
	private String member_nickname;
	private String review_date; 
	private int review_count;
	private String review_content; 
	private String review_filename; 
	private int review_filesize;
	
	public int getReview_id() {
		return review_id;
	}
	public String getReview_title() {
		return review_title;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public String getReview_date() {
		return review_date;
	}
	public int getReview_count() {
		return review_count;
	}
	public String getReview_content() {
		return review_content;
	}
	public String getReview_filename() {
		return review_filename;
	}
	public int getReview_filesize() {
		return review_filesize;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public void setReview_filename(String review_filename) {
		this.review_filename = review_filename;
	}
	public void setReview_filesize(int review_filesize) {
		this.review_filesize = review_filesize;
	}
		
}
