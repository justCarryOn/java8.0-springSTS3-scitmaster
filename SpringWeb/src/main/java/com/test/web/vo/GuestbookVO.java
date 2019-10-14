package com.test.web.vo;

import lombok.Data;

@Data
public class GuestbookVO {

	private int seq;
	private String name;
	private String pwd;
	private String content;
	private String regdate;
	private String originalFilename;
	private String savedFilename;

	public GuestbookVO() {
		super();
	}

	public GuestbookVO(int seq, String name, String pwd, String content, String regdate, String originalFilename,
			String savedFilename) {
		super();
		this.seq = seq;
		this.name = name;
		this.pwd = pwd;
		this.content = content;
		this.regdate = regdate;
		this.originalFilename = originalFilename;
		this.savedFilename = savedFilename;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public String getSavedFilename() {
		return savedFilename;
	}

	public void setSavedFilename(String savedFilename) {
		this.savedFilename = savedFilename;
	}

	@Override
	public String toString() {
		return "GuestbookVO [seq=" + seq + ", name=" + name + ", pwd=" + pwd + ", content=" + content + ", regdate="
				+ regdate + ", originalFilename=" + originalFilename + ", savedFilename=" + savedFilename + "]";
	}
}
