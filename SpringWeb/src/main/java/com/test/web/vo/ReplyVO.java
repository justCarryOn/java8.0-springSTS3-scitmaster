package com.test.web.vo;

import lombok.Data;

@Data
public class ReplyVO {

	private int replynum;
	private int boardNum;
	private String userid;
	private String replytext;
	private String inputdate;

	public ReplyVO() {
		super();
	}

	public ReplyVO(int replynum, int boardNum, String userid, String replytext, String inputdate) {
		super();
		this.replynum = replynum;
		this.boardNum = boardNum;
		this.userid = userid;
		this.replytext = replytext;
		this.inputdate = inputdate;
	}

	public int getReplynum() {
		return replynum;
	}

	public void setReplynum(int replynum) {
		this.replynum = replynum;
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

	public String getReplytext() {
		return replytext;
	}

	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	@Override
	public String toString() {
		return "ReplyVO [replynum=" + replynum + ", boardNum=" + boardNum + ", userid=" + userid + ", replytext="
				+ replytext + ", inputdate=" + inputdate + "]";
	}
}
