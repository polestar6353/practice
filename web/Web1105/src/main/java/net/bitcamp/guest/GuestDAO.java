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
			System.out.println("�������� " + e.toString());
		}
	}

	@Override
	public void dbInsert(int dcode, String dtitle, int dpay, String demail) {
		try {

			System.out.println("dbInsert�Լ� �Ѿ�� �ڵ� = " + dcode); // �ܼ�â���
			System.out.println("dbInsert�Լ� �Ѿ�� ���� = " + dtitle);
			System.out.println("dbInsert�Լ� �Ѿ�� �޿� = " + dpay);
			System.out.println("dbInsert�Լ� �Ѿ�� ���� = " + demail);

			msg = "insert into guest values(?,?,?,?)";
			PST = CN.prepareStatement(msg);
			PST.setInt(1, dcode);
			PST.setString(2, dtitle);
			PST.setInt(3, dpay);
			PST.setString(4, demail);
			PST.executeUpdate(); // ��¥ ���强��ó��
			System.out.println("�ܼ���� guest���̺� ���强���߽��ϴ� 11��05��");
		} catch (Exception e) {
			System.out.println("��������" + e.toString());
		}

	}

	@Override
	public void dbInsert(GuestDTO dto) {
		// TODO Auto-generated method stub
		try {

		} catch (Exception e) {
			System.out.println("��������" + e.toString());
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
			System.out.println("��������" + e.toString());
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
			System.out.println("��������" + e.toString());
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
			System.out.println("��������" + e.toString());
		}
		return dto;
	}

	@Override
	public void dbSearch(String find) {
		// TODO Auto-generated method stub
		try {

		} catch (Exception e) {
			System.out.println("��������" + e.toString());
		}
	}

	@Override
	public int dbSearchCount(String key) {
		// TODO Auto-generated method stub
		try {

		} catch (Exception e) {
			System.out.println("��������" + e.toString());
		}
		return 0;
	}

	@Override
	public void dbDelete() {
		// TODO Auto-generated method stub
		try {

		} catch (Exception e) {
			System.out.println("��������" + e.toString());
		}
	}

	@Override
	public void dbDelete(int data) {
		try {
			msg = "delete from guest  where code =  " + data;
			ST = CN.createStatement();
			int OK = ST.executeUpdate(msg);
			if (OK > 0) {
				System.out.println(data + " ������ ���� ���� �߽��ϴ�");
			} else {
			}
		} catch (Exception e) {
			System.out.println("��������" + e.toString());
		}
	}

	@Override
	public void dbUpdate() {
		// TODO Auto-generated method stub
		try {

		} catch (Exception e) {
			System.out.println("��������" + e.toString());
		}

	}

	@Override
	public void dbUpdate(int code) {
		// TODO Auto-generated method stub
		try {

		} catch (Exception e) {
			System.out.println("��������" + e.toString());
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
				System.out.println(code + " ������� �ڵ�=���̵��Դϴ�");
			}
			else{
				System.out.println(code +" ��밡���� �ڵ�=���̵��Դϴ�");
				}
		} catch (Exception e) {
			System.out.println("��������" + e.toString());
		}
		return Gtotal;
	}

}
