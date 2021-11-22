package net.hb.crud;

import java.io.File;
import javax.servlet.ServletContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	ServletContext  application; //���Ͼ��ε�/�ٿ�ε��Ҷ� application.getRealPath("����")
	
	@Autowired
	BoardDAO dao; 
	
	
	@RequestMapping(value = "/boardWrite.sp", method = RequestMethod.GET)
	public String board_write() {
		logger.info("Welcome home! board_write�޼ҵ�");
		return "boardWrite";  //WEB-INF/views/boardWrite.jsp���� �����ѿ� 
	}//end
	
	@RequestMapping("/boardInsert.sp")
	public String board_insert(BoardDTO dto) { //�Ѱ�����
		System.out.println("\nBoardController���� 10��12��");
		System.out.println("BoardController�Ѿ�� �̸� = " + dto.getName());
		System.out.println("BoardController�Ѿ�� ���� = " + dto.getTitle());
		System.out.println("BoardController�Ѿ�� ���� = " + dto.getContent());
		System.out.println("BoardController�Ѿ�� ��� = " + dto.getHobby());
		System.out.println("BoardController�Ѿ�� ���� = " + dto.getUpload_f());
		
		String path = application.getRealPath("./resources/upload");
		String img = dto.getUpload_f().getOriginalFilename();
	    System.out.println("BoardController�Ѿ�� img = " + img);
	    
	    File file = new File(path, img);
		try{ dto.getUpload_f().transferTo(file); }catch(Exception ex){  }  
		dto.setImg_file_name(img);  //��¥���̺� �̹����ʵ� img_file_name
		System.out.println("BoardController�Ѿ�� ���� = " + dto.getImg_file_name());
		dao.dbInsert(dto);
		return "boardList";
	}//end
	
	@RequestMapping("/boardList.sp")
	public String board_select( ) {//��ü���
		
	   return "boardList";
	}//end
	
	@RequestMapping("/boardDetail.sp")
	public void board_detail( ) { //�Ѱǻ�
		
	}//end
	
	
	///////////////////////////////////////////////////////////////////////
	@RequestMapping("/boardInsert2.sp")
	public String board_insert2(BoardDTO dto) { //�Ѱ�����
		System.out.println("\nBoardController board_insert2(BoardDTO)");
		System.out.println("BoardController�Ѿ�� �̸� = " + dto.getName());
		System.out.println("BoardController�Ѿ�� ���� = " + dto.getTitle());
		System.out.println("BoardController�Ѿ�� ���� = " + dto.getContent());
		System.out.println("BoardController�Ѿ�� ��� = " + dto.getHobby());
		System.out.println("BoardController�Ѿ�� ���� = " + dto.getUpload_f());
		return "boardList";
	}//end
	
}//BoardController class END


