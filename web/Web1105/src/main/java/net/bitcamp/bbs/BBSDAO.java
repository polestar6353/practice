package net.bitcamp.bbs;

import java.util.ArrayList;

import net.bitcamp.common.DB;

//순수자바는 데이터베이스처리=모델링=modeling=M, 웹관련기술금지
//순수자바는 단독실행금지 
public class BBSDAO  extends Global {

 public BBSDAO() {
   CN=DB.getConnection(); //반드시 필수구문 
 }//end

 public void dbInsert(BBSDTO dto) {
	try {
	  msg="insert into bbs(sabun,name,title,wdate,pay,hit,email) values(?,?,?,sysdate,?,0,?)";
	  PST = CN.prepareStatement(msg);
	  PST.setInt(1, dto.getSabun());
	  PST.setString(2, dto.getName());
	  PST.setString(3,dto.getTitle());
	  PST.setInt(4, dto.getPay());
	  PST.setString(5,dto.getEmail());
	  System.out.println(dto.getName());
	  PST.executeQuery();
	  	  
	}catch(Exception ex) { System.out.println("에러이유"+ex); }	
 }//end

 public ArrayList<BBSDTO> dbSelectAll(){
	ArrayList<BBSDTO> alist = new ArrayList<BBSDTO>();
	try {
	 String a="select * from (";
	 String b=" select rownum rn,sabun,name,title,wdate,pay,hit,email from bbs ";
	 String c="";
	 String d=") where rn  between  1  and  10";
	 msg  = a+b+c+d;
	}catch(Exception ex) { }
	return alist;
 }//end
 
  public int dbCountAll() {
	try {	
		msg = "select count(*) as cnt from bbs ";
		ST = CN.createStatement(); 
	    RS = ST.executeQuery(msg);
	    if(RS.next()==true){Gtotal = RS.getInt("cnt");  }
	}catch(Exception e){ System.out.println("에러이유 " + e.toString());}
	 return Gtotal;
  }//end
  
  public int dbCountKeyVal(String skey, String sval) {
	  try { 
		  msg="select count(*) as cnt from bbs  where " + skey +" like '%"+sval+"%' ";
		  ST = CN.createStatement();
		  RS = ST.executeQuery(msg);
		  if(RS.next()==true){ Gtotal = RS.getInt("cnt"); } 
	  }catch(Exception e){ System.out.println("에러이유 " + e.toString());}
	   return Gtotal;
  }
  public ArrayList<BBSDTO> dbSelectKeyVal(String sqry, int startRow, int endRow){
	  ArrayList<BBSDTO> alist = new ArrayList<BBSDTO>();
	  try {
	  
		  String a ="select * from ( " ;
		  String b =" select rownum  rn,  b.* ,  (select count(*) from bbsreply r  where b.sabun=r.sabun) as rcnt  from " ;
		  String y = " ( select * from bbs " + sqry + " order by sabun )  b " ;
		  String c =" ) where rn between " + startRow + "  and  " + endRow  ;
		  
		  msg = a+b+y+c;

		  ST = CN.createStatement();
		  RS = ST.executeQuery(msg);
		  
		  while (RS.next()) {
			  BBSDTO mydto = new BBSDTO();
			  mydto.setRn(RS.getInt("rn"));
			  mydto.setSabun(RS.getInt("sabun"));
			  mydto.setName(RS.getString("name"));
			  mydto.setTitle(RS.getString("title"));
			  mydto.setWdate(RS.getTimestamp("wdate"));
			  //Gwdate = RS.getTimestamp("wdate");
			  //display= sdf.format(Gwdate);
			  mydto.setHit(RS.getInt("hit"));
			  mydto.setEmail(RS.getString("email"));
			  mydto.setRcount(RS.getInt("rcnt"));
			  alist.add(mydto);
		  }
	  }catch (Exception e) {
		// TODO: handle exception
		  }
	  return alist;
  }
	public BBSDTO dbDetail(int sabun) {
		BBSDTO mydto = new BBSDTO();
		try {
			msg = "select * from bbs where sabun = " + sabun ;
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			if (RS.next()) {
				mydto.setSabun(RS.getInt("sabun"));
				mydto.setName(RS.getString("name"));
				mydto.setTitle(RS.getString("title"));
				mydto.setWdate(RS.getDate("wdate"));
				mydto.setHit(RS.getInt("hit"));
				mydto.setEmail(RS.getString("email"));		
			}
		} catch (Exception e) {
			System.out.println("에러이유" + e.toString());
		}
		return mydto;
	}
	
	public void dbCountPlus(int sabun) {
		try {
		msg = "update bbs set hit=hit +1 where  sabun = " + sabun;
		ST = CN.createStatement();
		ST.executeUpdate(msg);
		}
		catch (Exception e) {
		}
	}
  
	
}//BBSDAO class END
