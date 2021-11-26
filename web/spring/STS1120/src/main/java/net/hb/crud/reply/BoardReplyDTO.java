package net.hb.crud.reply;

import org.springframework.web.multipart.MultipartFile; //새로추가

public class BoardReplyDTO {
	private String rwriter, rmemo;
	private int hobby_idx, rrn, rhobby_idx;
	
	
	
	
	public int getRrn() {
		return rrn;
	}
	public void setRrn(int rrn) {
		this.rrn = rrn;
	}
	public int getRhobby_idx() {
		return rhobby_idx;
	}
	public void setRhobby_idx(int rhobby_idx) {
		this.rhobby_idx = rhobby_idx;
	}
	public String getRwriter() {
		return rwriter;
	}
	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}
	public String getRmemo() {
		return rmemo;
	}
	public void setRmemo(String rmemo) {
		this.rmemo = rmemo;
	}
	public int getHobby_idx() {
		return hobby_idx;
	}
	public void setHobby_idx(int hobby_idx) {
		this.hobby_idx = hobby_idx;
	}

}//class END
