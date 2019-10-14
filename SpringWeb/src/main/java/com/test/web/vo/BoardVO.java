package com.test.web.vo;

import lombok.Data;

@Data
public class BoardVO {

	private int boardNum;
	private String userid;
	private String title;
	private String content;
	private String inputdate;
	private String originalFileName;
	private String savedFileName;
	private int hit;

	public BoardVO() {
		super();
	}

	public BoardVO(int boardNum, String userid, String title, String content, String inputdate, String originalFileName,
			String savedFileName, int hit) {
		super();
		this.boardNum = boardNum;
		this.userid = userid;
		this.title = title;
		this.content = content;
		this.inputdate = inputdate;
		this.originalFileName = originalFileName;
		this.savedFileName = savedFileName;
		this.hit = hit;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getSavedFileName() {
		return savedFileName;
	}

	public void setSavedFileName(String savedFileName) {
		this.savedFileName = savedFileName;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "BoardVO [boardNum=" + boardNum + ", userid=" + userid + ", title=" + title + ", content=" + content
				+ ", inputdate=" + inputdate + ", originalFileName=" + originalFileName + ", savedFileName="
				+ savedFileName + ", hit=" + hit + "]";
	}
}
