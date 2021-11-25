package net.hb.crud;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
    
	@Autowired
	SqlSessionTemplate temp; //db������ id����
	
  public void dbInsert(BoardDTO dto) {
	  temp.insert("board.add", dto); 
	  System.out.println("dao�ܿ��� ���强��");
  }//end
  
  
  public List<BoardDTO> dbSelect(int startRow, int endRow, String Skey, String Sval) {
	  BoardDTO dto = new BoardDTO();
	  dto.setStartRow(startRow);
	  dto.setEndRow(endRow);
	  dto.setSkey(Skey);
	  dto.setSval(Sval);
	  List<BoardDTO> list = temp.selectList("board.selectAll", dto);
	  return list;
  }//end
  
  
  public int dbCountAll() {
	  int Gtotal = temp.selectOne("board.countAll");
	  return Gtotal;
  }
  
  public int dbCountAllSearch(String Skey, String Sval) {
	  BoardDTO dto = new BoardDTO();
	  dto.setSkey(Skey);
	  dto.setSval(Sval);
	  int GGtotal =temp.selectOne("board.countAllSearch",dto);
	  return GGtotal;
  }
  
  
  public BoardDTO dbDetail(int code) {
	  BoardDTO dto = temp.selectOne("board.detail",code);
	  return dto;
  }//end
  
  public void dbDelete(int code) {
	  temp.selectOne("board.delete",code);
  }
  

  public void dbUpdate(BoardDTO dto) {
	  temp.update("board.update",dto);	
  }
  
  
  public void dbInsert2(BoardDTO dto) { //���纻
	System.out.println("\nBoardDAO���� dbInsert2(BoardDTO)");
	System.out.println("dao�Ѿ�� �̸� = " + dto.getName());
	System.out.println("dao�Ѿ�� ���� = " + dto.getTitle());
	System.out.println("dao�Ѿ�� ���� = " + dto.getContent());
	System.out.println("dao�Ѿ�� ��� = " + dto.getHobby());
	System.out.println("dao�Ѿ�� ���� = " + dto.getImg_file_name());
  }//end 


}//class END
