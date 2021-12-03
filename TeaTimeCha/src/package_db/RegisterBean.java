package package_db;

public class RegisterBean{

	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_nickname;
	
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	
	public String getMember_id() {
		return member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public String getMember_name() {
		return member_name;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	
}
