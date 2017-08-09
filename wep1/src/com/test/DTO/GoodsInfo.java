package com.test.DTO;

public class GoodsInfo {

	private int giNum;
	private String giName;
	private String giDesc;
	private int viNum;
	private String viName;
	private String command;
	private Page page;
	
	public int getGiNum() {
		return giNum;
	}
	public String getGiName() {
		return giName;
	}
	public String getGiDesc() {
		return giDesc;
	}
	public int getViNum() {
		return viNum;
	}
	public String getViName() {
		return viName;
	}
	public void setGiNum(int giNum) {
		this.giNum = giNum;
	}
	public void setGiName(String giName) {
		this.giName = giName;
	}
	public void setGiDesc(String giDesc) {
		this.giDesc = giDesc;
	}
	public void setViNum(int viNum) {
		this.viNum = viNum;
	}
	public void setViName(String viName) {
		this.viName = viName;
	}
	
	public String getCommand() {
		return command;
	}
	public void setCommand(String command) {
		this.command = command;
	}
	
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	
	@Override
	public String toString() {
		return "GoodsInfo [giNum=" + giNum + ", giName=" + giName + ", giDesc=" + giDesc + ", viNum=" + viNum
				+ ", viName=" + viName + ", command=" + command + ", page=" + page + "]";
	}
	
}
