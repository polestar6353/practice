package net.hb.crud;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	
	
	public void dbInsert(BoardDTO dto) {
		System.out.println("BoardDAO���� 3��59��");
		//insert into values���������� ����
		//xml���� insert into �������� ����...
	}//end
	
	public List<BoardDTO> sbSelect() {
		List<BoardDTO> list = null;
		return list;
	}//end
	
	public BoardDTO dbDetail(int code) {
		BoardDTO dto = new BoardDTO();
		return dto;
	}//end
	
	
	public void dbInsert2(BoardDTO dto) { //���纻
		System.out.println("\nBoardDAO ���� dbInsert2(BoardDTO)");
		System.out.println("dao �Ѿ�� �̸� = " + dto.getName());
		System.out.println("dao �Ѿ�� ���� = " + dto.getTitle());
		System.out.println("dao �Ѿ�� ���� = " + dto.getContent());
		System.out.println("dao �Ѿ�� ��� = " + dto.getHobby());
		System.out.println("dao �Ѿ�� ���� = ");
		//insert into values���������� ����
	}//end
	
	
}//class END
