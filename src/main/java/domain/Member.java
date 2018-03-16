package domain;

import java.util.Date;

public class Member {
	private String userid;
	private String password;
	private String email;
	private Date regdate;
	private int postnum;

	public Member() {}
	public Member(String userid, String password, String email, Date regdate) {
		this.userid = userid;
		this.password = password;
		this.email = email;
		this.regdate = regdate;
	}
	public Member(String userid, String password, String email, Date regdate, int postnum) {
		this.userid = userid;
		this.password = password;
		this.email = email;
		this.regdate = regdate;
		this.postnum = postnum;
	}

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getPostnum() {
		return postnum;
	}
	public void setPostnum(int postnum) {
		this.postnum = postnum;
	}

}
