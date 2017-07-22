package com.test.DTO;

public class BoardInfo {

	private int boardNum;
	private String boardTitle;
	private String boardContent;
	private String boardPwd;
	private String boardWriter;
	private String boardDate;

	public int getBoardNum(){
		return boardNum;
	}
	
	public void setBoardNum(int boardNum){
		this.boardNum = boardNum;
	}
	public String getBoardTitlem(){
		return boardTitle;
	}
	
	public void setBoardTitle(String boardTitle){
		this.boardTitle = boardTitle;
	}
	public String getBoardContent(){
		return boardContent;
	}
	
	public void setBoardContent(String boardContent){
		this.boardContent = boardContent;
	}
	public String getBoardPwd(){
		return boardPwd;
	}
	
	public void setBoardPwd(String boardPwd){
		this.boardPwd = boardPwd;
	}
	public String getBoardWriter(){
		return boardWriter;
	}
	
	public void setBoardWriter(String boardWriter){
		this.boardWriter = boardWriter;
	}
	public String getBoardDate(){
		return boardDate;
	}
	
	public void setBoardDate(String boardDate){
		this.boardDate = boardDate;
	}
}
