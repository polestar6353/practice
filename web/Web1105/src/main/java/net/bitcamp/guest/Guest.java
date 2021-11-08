package net.bitcamp.guest;

import java.util.ArrayList;

public interface Guest {
	public void dbInsert(int a,String b,int c,String d);
	public void dbInsert(GuestDTO dto);

	public ArrayList<GuestDTO> dbSelectAll();
	public int dbCountAll();
	
	public void dbSearch(String find);
	public int dbSearchCount(String key);
	
	public GuestDTO dbDetail(int code);
	
	//�Ȱ��� �̸��� �޼ҵ� �ߺ�=�����ε�
	public void dbDelete();
	public void dbDelete(int code);
	
	public void dbUpdate();
	public void dbUpdate(int code);
}
