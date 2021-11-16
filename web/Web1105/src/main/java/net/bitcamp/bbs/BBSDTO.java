package net.bitcamp.bbs;

public class BBSDTO {
   private int  rn,sabun, pay, hit,rcount;
   private String name,title,email;
   private java.util.Date  wdate;
   private String skey, sval ;
   
	public int getRn() {return rn;}
	public void setRn(int rn) {this.rn = rn;}
	public int getSabun() {return sabun;}
	public void setSabun(int sabun) {this.sabun = sabun;	}
	public int getPay() {return pay;	}
	public void setPay(int pay) {this.pay = pay;}
	public int getHit() {return hit;}
	public void setHit(int hit) {this.hit = hit;}
	public int getRcount() {return rcount;}
	public void setRcount(int rcount) {this.rcount = rcount;}
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	public String getTitle() {return title;	}
	public void setTitle(String title) {this.title = title;}
	public String getEmail() {return email;	}
	public void setEmail(String email) {this.email = email;	}
	public java.util.Date getWdate() {return wdate;	}
	public void setWdate(java.util.Date wdate) {this.wdate = wdate;	}
	public String getSkey() {return skey;}
	public void setSkey(String skey) {this.skey = skey;	}
	public String getSval() {return sval;	}
	public void setSval(String sval) {this.sval = sval;	}
	
}//BBSDTO class END
