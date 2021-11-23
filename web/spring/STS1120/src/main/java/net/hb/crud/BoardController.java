package net.hb.crud;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String board_insert(BoardDTO dto) { //jsp���� �����͸� ������ request.getParamater("title")
		String path = application.getRealPath("./resources/upload");
		
		String img = dto.getUpload_f().getOriginalFilename();
		File file = new File(path, img); //input type="file" name="upload_f"
		try{ dto.getUpload_f().transferTo(file); }catch(Exception ex){  }  
		dto.setImg_file_name(img); 

		dao.dbInsert(dto); 
		return "redirect:/boardList.sp"; //WEB-INF/views/boardList.jsp������� �ٷ� �ؿ� �ִ� ��Ʈ�� �������� �̵�.
   }//end
	
	@RequestMapping("/boardList.sp")
	public String board_select(Model model) {//��ü���
		List<BoardDTO> LG = dao.dbSelect(); 
		model.addAttribute("LG", LG); //request.setAttribute�� ��������
	   return "boardList";
	}//end
	
	@RequestMapping("/boardDetail.sp")
	public void board_detail( ) { //�Ѱǻ�
		
	}//end
	
	
	///////////////////////////////////////////////////////////////////////
	   @RequestMapping("/boardInsert2.sp")
	   public String board_insert2(BoardDTO dto) { //���纻
	      System.out.println("\nBoardController���� 11-23-ȭ���� 1��17��");
	      System.out.println("BoardController�Ѿ�� �̸� = " + dto.getName());
	      System.out.println("BoardController�Ѿ�� ���� = " + dto.getTitle());
	      System.out.println("BoardController�Ѿ�� ���� = " + dto.getContent());
	      System.out.println("BoardController�Ѿ�� ��� = " + dto.getHobby());
	      System.out.println("BoardController�Ѿ�� ���� = " + dto.getUpload_f());
	      System.out.println("BoardController�Ѿ�� ���� = " + dto.getImg_file_name());
	      
	      String path = application.getRealPath("./resources/upload");
	      String img = dto.getUpload_f().getOriginalFilename();
	       System.out.println("BoardController�Ѿ�� img = " + img);
	       
	       File file = new File(path, img);
	      try{ dto.getUpload_f().transferTo(file); }catch(Exception ex){  }  
	      dto.setImg_file_name(img);  //��¥���̺� �̹����ʵ� img_file_name
	      System.out.println("BoardController�Ѿ�� ���� = " + dto.getImg_file_name());
	      //dao.dbInsert(dto);
	      return "boardList";
	   }//end
	
}//BoardController class END


