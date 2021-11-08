package net.bitcamp.guest;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date ;

public class Global { //일반클래스
	   Connection CN ;
	   Statement ST ;
	   PreparedStatement PST;
	   ResultSet RS ;
	   
	   int Grn, Grow, Gsabun, Gcode, Gpay, Ghit, Gtotal, GStotal ;   
       String Gname, Gtitle, Gemail, Gmemo, GID, GPWD ; 
       java.util.Date Gdate, Gwdate ;
       String Gmsg, msg, Gdata;
       
       int Rrn, Rnum, Rsabun, Rcode;
       String Rwriter, Rcontent;
       
       int dcode, dpay ; //guestSave.jsp 
       String dtitle,demail ;  //guestSave.jsp
       
       ArrayList alist = new ArrayList();
       java.util.Date  dt = new java.util.Date();

}//class END




