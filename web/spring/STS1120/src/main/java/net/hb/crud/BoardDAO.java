package net.hb.crud;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
    
  public void dbInsert(BoardDTO dto) {
	System.out.println("\nBoardDAO���� 10��12��");
	System.out.println("dao�Ѿ�� �̸� = " + dto.getName());
	System.out.println("dao�Ѿ�� ���� = " + dto.getTitle());
	System.out.println("dao�Ѿ�� ���� = " + dto.getContent());
	System.out.println("dao�Ѿ�� ��� = " + dto.getHobby());
	System.out.println("dao�Ѿ�� ���� = " + dto.getImg_file_name()); 
  }//end
  
  public List<BoardDTO> dbSelect() {
	  List<BoardDTO> list = null ;
	  return list ;
  }//end
  
  public BoardDTO dbDetail(int code) {
	  BoardDTO dto = new BoardDTO();
	  return dto;
  }//end
  
  public void dbInsert2(BoardDTO dto) { //���纻
	System.out.println("\nBoardDAO���� dbInsert2(BoardDTO)");
	System.out.println("dao�Ѿ�� �̸� = " + dto.getName());
	System.out.println("dao�Ѿ�� ���� = " + dto.getTitle());
	System.out.println("dao�Ѿ�� ���� = " + dto.getContent());
	System.out.println("dao�Ѿ�� ��� = " + dto.getHobby());
	System.out.println("dao�Ѿ�� ���� = " + dto.getImg_file_name());
  }//end 
}//class END
