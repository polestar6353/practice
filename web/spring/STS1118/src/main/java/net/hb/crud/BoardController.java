package net.hb.crud;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	ServletContext application; //���Ͼ��ε�/�ٿ��Ҷ� application.getRealPath("����")
	
	@Autowired
	BoardDAO dao; //BoardDAO dao = new BoardDAO();
	
	
	@RequestMapping(value = "/boardWrite.sp", method = RequestMethod.GET)
	public String board_write() {
		logger.info("Welcome home! board_wirte�޼ҵ�");
		return "boardWrite"; //WEB-INF/views����/boardWrite.jsp������ ����Ŵ.
	}
	
	@RequestMapping("/boardInsert.sp")
	public String board_insert(BoardDTO dto) {
		System.out.println("BoardController ���� 3:59");
		dao.dbInsert(dto);
		return "boardList";
	}//end
	
	@RequestMapping("/boardList.sp")
	public String board_select() {
		
		return "boardList";
	}//end
	
	@RequestMapping("/boardDetail.sp")
	public void board_detail() {
		
	}//end
	
	@RequestMapping("/boardInsert2.sp")
	public String board_insert2(BoardDTO dto) { //�Ѱ�����
		System.out.println("\nBoard��Ʈ�ѷ� ���� board_Insert(BoardDTO)");
		System.out.println("BoardController �Ѿ�� �̸� = "+dto.getName());
		System.out.println("BoardController �Ѿ�� ���� = "+dto.getTitle());
		System.out.println("BoardController �Ѿ�� ���� = "+dto.getContent());
		System.out.println("BoardController �Ѿ�� ��� = "+dto.getHobby());
		//System.out.println("BoardController �Ѿ�� ���� = ");
		return "boardList";
	}//end
}//BoardController class END
