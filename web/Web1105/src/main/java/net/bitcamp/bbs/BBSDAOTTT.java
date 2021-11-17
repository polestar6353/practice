package net.bitcamp.bbs;

import java.util.ArrayList;

import net.bitcamp.common.DB;

//�����ڹٴ� �����ͺ��̽�ó��=�𵨸�=modeling=M, �����ñ������
//�����ڹٴ� �ܵ�������� 
public class BBSDAO  extends Global {

 public BBSDAO() {
   CN=DB.getConnection(); //�ݵ�� �ʼ�����
 }//end

 
 public void dbInsert(int d_sabun, String d_name, String d_title, int d_pay, int d_hit, String d_email) { 
	try {
	  msg="insert into bbs(sabun,name,title,wdate,pay,hit,email) values(?,?,?,sysdate,?,?,?)";
	  PST = CN.prepareStatement(msg);
	  		PST.setInt(1, d_sabun);
	  		PST.setString(2, d_name);
	  		PST.setString(3, d_title);
	  		PST.setInt(4, d_pay);
	  		PST.setInt(5, d_hit);
	  		PST.setString(6, d_email);
	  PST.executeUpdate();
	}catch(Exception ex){System.out.println("DAO�� ������� " + ex.toString()); }	
 }//end

 
 public void dbInsert(BBSDTO dto) { 
	try {
	  msg="inser into bbs(sabun,name,title,wdate,pay,hit,email) values(?,?,?,sysdate,?,?,?)";
	  PST = CN.prepareStatement(msg);
	}catch(Exception ex) {System.out.println("DAO�� ������� " + ex.toString());  }	
 }//end
 
 
 
 public ArrayList<BBSDTO> dbSelectAll(int startRow, int endRow){
	ArrayList<BBSDTO> alist = new ArrayList<BBSDTO>();
	try {
	 String a="select * from (";
	 String b=" select rownum rn,sabun,name,title,wdate,pay,hit,email from bbs ";
	 String c="";
	 String d=") where rn  between  "+ startRow +" and " + endRow;
	 msg  = a+b+c+d;
	 ST = CN.createStatement();
	 RS = ST.executeQuery(msg);
	 while(RS.next()==true) {
		 BBSDTO dto = new BBSDTO();
		 dto.setRn(RS.getInt("rn"));
		 dto.setSabun(RS.getInt("sabun"));
		 dto.setName(RS.getString("name"));
		 dto.setTitle(RS.getString("title"));
		 dto.setWdate(RS.getDate("wdate"));
		 dto.setPay(RS.getInt("pay"));
		 dto.setHit(RS.getInt("hit"));
		 dto.setEmail(RS.getString("email"));
		 alist.add(dto); //�ݵ�ñ���ϼ���
	 }//while end
	}catch(Exception ex) {System.out.println("DAO�� ��ü��ȸ���� " + ex.toString());  }
	return alist;
 }//end
 
 
  public int dbCountAll() {
	try {	
		msg = "select count(*) as cnt from bbs ";
		ST = CN.createStatement(); 
	    RS = ST.executeQuery(msg);
	    if(RS.next()==true){Gtotal = RS.getInt("cnt");  }
	}catch(Exception ex){ System.out.println("DAO�� ���ڵ���ü�������� " + ex.toString()); }
	 return Gtotal;
  }//end
  
  
  public int dbCountAllSearch(String skey, String sval) {
	try {	
		msg = "select count(*) as cnt from bbs  where "+ skey +" like '%"+ sval + "%' ";
		ST = CN.createStatement(); 
	    RS = ST.executeQuery(msg);
	    if(RS.next()==true){GStotal = RS.getInt("cnt");  }
	}catch(Exception ex){ System.out.println("DAO�� skey,sval �����ִ� ���ڵ���ü�������� " + ex.toString()); }
	 return GStotal;
  }//end
  
  
  public BBSDTO  dbDetail(int data) {
	BBSDTO dto = new BBSDTO();  
	try {
	  msg = "select * from bbs where sabun = " + data ;
	  ST = CN.createStatement();
	  RS = ST.executeQuery(msg);
	  if(RS.next()==true) {
		 dto.setSabun(RS.getInt("sabun"));
		 dto.setName(RS.getString("name"));
		 dto.setTitle(RS.getString("title"));
		 dto.setWdate(RS.getDate("wdate"));
		 dto.setPay(RS.getInt("pay"));
		 dto.setHit(RS.getInt("hit"));
		 dto.setEmail(RS.getString("email"));  
	  }
	}catch(Exception ex){System.out.println("DAO�� �Ѱǻ󼼽��� " + ex.toString()); }
	return dto;
  }//end
  
  
  public ArrayList<BBSDTO> dbSelectAll(int startRow, int endRow, String skey, String sval){
		ArrayList<BBSDTO> alist = new ArrayList<BBSDTO>();
		try {
		 String a="select * from (";
		 String b=" select rownum rn,sabun,name,title,wdate,pay,hit,email from  ";
		 String c="(select * from bbs  where " + skey + " like '%"+ sval +"%')";
		 String d=") where rn  between  "+ startRow +" and " + endRow;
		 msg  = a+b+c+d;
		 ST = CN.createStatement();
		 RS = ST.executeQuery(msg);
		 while(RS.next()==true) {
			 BBSDTO dto = new BBSDTO();
			 dto.setRn(RS.getInt("rn"));
			 dto.setSabun(RS.getInt("sabun"));
			 dto.setName(RS.getString("name"));
			 dto.setTitle(RS.getString("title"));
			 dto.setWdate(RS.getDate("wdate"));
			 dto.setPay(RS.getInt("pay"));
			 dto.setHit(RS.getInt("hit"));
			 dto.setEmail(RS.getString("email"));
			 alist.add(dto); //�ݵ�ñ���ϼ���
		 }//while end
		}catch(Exception ex) {System.out.println("DAO�� startRow,endRow, skey, sval��ü��ȸ���� " + ex.toString() +"\n");  }
		return alist;
	 }//end
}//BBSDAO class END
















