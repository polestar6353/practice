package net.bitcamp.guest;

import java.sql.SQLException;
import java.util.ArrayList;

import net.bitcamp.common.DB;

public class GuestDAO extends Global implements Guest {

	public GuestDAO() {
		try {
			CN = DB.getConnection();
			ST = CN.createStatement();
		} catch (Exception e) {
			System.out.println("에러이유 " + e.toString());
		}
	}

	@Override
	public void dbInsert(int dcode, String dtitle, int dpay, String demail) {
		try {

			System.out.println("dbInsert함수 넘어온 코드 = " + dcode); // 콘솔창출력
			System.out.println("dbInsert함수 넘어온 제목 = " + dtitle);
			System.out.println("dbInsert함수 넘어온 급여 = " + dpay);
			System.out.println("dbInsert함수 넘어온 메일 = " + demail);

			msg = "insert into guest values(?,?,?,?)";
			PST = CN.prepareStatement(msg);
			PST.setInt(1, dcode);
			PST.setString(2, dtitle);
			PST.setInt(3, dpay);
			PST.setString(4, demail);
			PST.executeUpdate(); // 진짜 저장성공처리
			System.out.println("콘솔출력 guest테이블 저장성공했습니다 11월05일");
		} catch (Exception e) {
			System.out.println("에러이유" + e.toString());
		}

	}

	@Override
	public void dbInsert(GuestDTO dto) {
		// TODO Auto-generated method stub
		try {

		} catch (Exception e) {
			System.out.println("에러이유" + e.toString());
		}
	}

	@Override
	public ArrayList<GuestDTO> dbSelectAll() {
		ArrayList<GuestDTO> alist = new ArrayList<GuestDTO>();

		try {
			msg = "select * from guest order by code";
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while (RS.next()) {
				GuestDTO mydto = new GuestDTO();
				mydto.setCode(RS.getInt("code"));
				mydto.setTitle(RS.getString("title"));
				mydto.setPay(RS.getInt("pay"));
				mydto.setEmail(RS.getString("email"));
				alist.add(mydto);
			}

		} catch (Exception e) {
			System.out.println("에러이유" + e.toString());
		}
		return alist;
	}

	@Override
	public int dbCountAll() {
		try {
			msg = "select count(*) as cnt from guest ";
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			if (RS.next() == true) {
				Gtotal = RS.getInt("cnt");
			}
		} catch (Exception e) {
			System.out.println("에러이유" + e.toString());
		}
		return Gtotal;
	}

	@Override
	public GuestDTO dbDetail(int code) {
		GuestDTO dto = new GuestDTO();
		try {
			msg = "select * from guest where code = " + code;
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			if (RS.next()) {
				dto.setCode(RS.getInt("code"));
				dto.setTitle(RS.getString("title"));
				dto.setPay(RS.getInt("pay"));
				dto.setEmail(RS.getString("email"));
			}
		} catch (Exception e) {
			System.out.println("에러이유" + e.toString());
		}
		return dto;
	}

	@Override
	public void dbSearch(String find) {
		// TODO Auto-generated method stub
		try {

		} catch (Exception e) {
			System.out.println("에러이유" + e.toString());
		}
	}

	@Override
	public int dbSearchCount(String key) {
		// TODO Auto-generated method stub
		try {

		} catch (Exception e) {
			System.out.println("에러이유" + e.toString());
		}
		return 0;
	}

	@Override
	public void dbDelete() {
		// TODO Auto-generated method stub
		try {

		} catch (Exception e) {
			System.out.println("에러이유" + e.toString());
		}
	}

	@Override
	public void dbDelete(int data) {
		try {
			msg = "delete from guest  where code =  " + data;
			ST = CN.createStatement();
			int OK = ST.executeUpdate(msg);
			if (OK > 0) {
				System.out.println(data + " 데이터 삭제 성공 했습니다");
			} else {
			}
		} catch (Exception e) {
			System.out.println("에러이유" + e.toString());
		}
	}

	@Override
	public void dbUpdate() {
		// TODO Auto-generated method stub
		try {

		} catch (Exception e) {
			System.out.println("에러이유" + e.toString());
		}

	}

	@Override
	public void dbUpdate(int code) {
		// TODO Auto-generated method stub
		try {

		} catch (Exception e) {
			System.out.println("에러이유" + e.toString());
		}

	}

	public int idCheck(int code) {
		try {

			msg = "select count(*) as cnt from guest where code = " + code;
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			if (RS.next() == true) {
				Gtotal = RS.getInt("cnt");
			}

			if (Gtotal > 0) {
				System.out.println(code + " 사용중인 코드=아이디입니다");
			}
			else{
				System.out.println(code +" 사용가능한 코드=아이디입니다");
				}
		} catch (Exception e) {
			System.out.println("에러이유" + e.toString());
		}
		return Gtotal;
	}

}
