package net.hb.crud.reply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.hb.crud.BoardDTO;

@Repository
public class BoardReplyDAO {
    
	@Autowired
	SqlSessionTemplate temp; //dbƒı∏ÆπÆ id¡¢±Ÿ
	 
	
	public void dbInsert(BoardReplyDTO dto) {
		temp.insert("board_reply.add",dto);
		
	}
	
	public List<BoardReplyDTO> dbSelect(int idx) {
		List <BoardReplyDTO> list;
		
		BoardReplyDTO dto = new BoardReplyDTO();
		dto.setHobby_idx(idx);

		list = temp.selectList("board_reply.select", dto);
		
		return list;
	}
	
	public void dbDelete(BoardReplyDTO dto) {
		temp.delete("board_reply.del",dto);
	}
	
	public void dbUpdate(BoardReplyDTO dto) {
		temp.update("board_reply.update",dto);
	}

}//class END
