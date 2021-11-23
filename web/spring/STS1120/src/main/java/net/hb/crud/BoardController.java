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
	ServletContext  application; //파일업로드/다운로드할때 application.getRealPath("폴더")
	
	@Autowired
	BoardDAO dao; 
	
	
	@RequestMapping(value = "/boardWrite.sp", method = RequestMethod.GET)
	public String board_write() {
		logger.info("Welcome home! board_write메소드");
		return "boardWrite";  //WEB-INF/views/boardWrite.jsp문서 가르켜요 
	}//end
	
	@RequestMapping("/boardInsert.sp")
	public String board_insert(BoardDTO dto) { //jsp에서 데이터를 받을때 request.getParamater("title")
		String path = application.getRealPath("./resources/upload");
		
		String img = dto.getUpload_f().getOriginalFilename();
		File file = new File(path, img); //input type="file" name="upload_f"
		try{ dto.getUpload_f().transferTo(file); }catch(Exception ex){  }  
		dto.setImg_file_name(img); 

		dao.dbInsert(dto); 
		return "redirect:/boardList.sp"; //WEB-INF/views/boardList.jsp문서대신 바로 밑에 있는 컨트롤 매핑으로 이동.
   }//end
	
	@RequestMapping("/boardList.sp")
	public String board_select(Model model) {//전체출력
		List<BoardDTO> LG = dao.dbSelect(); 
		model.addAttribute("LG", LG); //request.setAttribute와 같은역할
	   return "boardList";
	}//end
	
	@RequestMapping("/boardDetail.sp")
	public void board_detail( ) { //한건상세
		
	}//end
	
	
	///////////////////////////////////////////////////////////////////////
	   @RequestMapping("/boardInsert2.sp")
	   public String board_insert2(BoardDTO dto) { //복사본
	      System.out.println("\nBoardController문서 11-23-화요일 1시17분");
	      System.out.println("BoardController넘어온 이름 = " + dto.getName());
	      System.out.println("BoardController넘어온 제목 = " + dto.getTitle());
	      System.out.println("BoardController넘어온 내용 = " + dto.getContent());
	      System.out.println("BoardController넘어온 취미 = " + dto.getHobby());
	      System.out.println("BoardController넘어온 파일 = " + dto.getUpload_f());
	      System.out.println("BoardController넘어온 파일 = " + dto.getImg_file_name());
	      
	      String path = application.getRealPath("./resources/upload");
	      String img = dto.getUpload_f().getOriginalFilename();
	       System.out.println("BoardController넘어온 img = " + img);
	       
	       File file = new File(path, img);
	      try{ dto.getUpload_f().transferTo(file); }catch(Exception ex){  }  
	      dto.setImg_file_name(img);  //진짜테이블 이미지필드 img_file_name
	      System.out.println("BoardController넘어온 파일 = " + dto.getImg_file_name());
	      //dao.dbInsert(dto);
	      return "boardList";
	   }//end
	
}//BoardController class END


