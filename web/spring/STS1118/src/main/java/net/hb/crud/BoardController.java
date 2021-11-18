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
	ServletContext application; //파일업로드/다운할때 application.getRealPath("폴더")
	
	@Autowired
	BoardDAO dao; //BoardDAO dao = new BoardDAO();
	
	
	@RequestMapping(value = "/boardWrite.sp", method = RequestMethod.GET)
	public String board_write() {
		logger.info("Welcome home! board_wirte메소드");
		return "boardWrite"; //WEB-INF/views폴더/boardWrite.jsp문서를 가리킴.
	}
	
	@RequestMapping("/boardInsert.sp")
	public String board_insert(BoardDTO dto) {
		System.out.println("BoardController 문서 3:59");
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
	public String board_insert2(BoardDTO dto) { //한건저장
		System.out.println("\nBoard컨트롤러 문서 board_Insert(BoardDTO)");
		System.out.println("BoardController 넘어온 이름 = "+dto.getName());
		System.out.println("BoardController 넘어온 제목 = "+dto.getTitle());
		System.out.println("BoardController 넘어온 내용 = "+dto.getContent());
		System.out.println("BoardController 넘어온 취미 = "+dto.getHobby());
		//System.out.println("BoardController 넘어온 파일 = ");
		return "boardList";
	}//end
}//BoardController class END
