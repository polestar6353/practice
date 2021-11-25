package net.hb.crud;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


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
	public String board_select(Model model, HttpServletRequest request,@RequestParam(value="keyfield", defaultValue="name") String Skey, 
			@RequestParam(value="keyword",defaultValue="") String Sval, @RequestParam(value="page", defaultValue="1") int pageNum) {//��ü���
		
		
		if(Skey.equals("")||Skey=="") {
			Skey="name";
		}
		
		int GGtotal = dao.dbCountAllSearch(Skey,Sval);
		int Gtotal = dao.dbCountAll();
		int pageCount;
		if(GGtotal%10==0) {
			pageCount=GGtotal/10;
		}else {pageCount=GGtotal/10 +1;}
		
		int startRow=(pageNum-1)*10+1;
		int endRow=startRow+9;
		
		int startPage=pageNum-(pageNum-1)%10;
		int endPage=startPage+9;
		
		
		if(endPage>pageCount) {
			endPage=pageCount;
		}
		

		
		String returnpage = "&keyfield="+Skey+"&keyword="+Sval; 


		List<BoardDTO> LG = dao.dbSelect(startRow,endRow,Skey,Sval); 

		
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("LG", LG); //request.setAttribute�� ��������
		model.addAttribute("Gtotal",Gtotal);
		model.addAttribute("GGtotal",GGtotal);
		model.addAttribute("returnpage",returnpage);
		return "boardList";
	}//end
	
	
	@RequestMapping("/boardDetail.sp")
	public String board_detail(HttpServletRequest request,Model model) { //�Ѱǻ�
		int data=Integer.parseInt(request.getParameter("idx"));
		BoardDTO dto = dao.dbDetail(data);
		model.addAttribute("dto",dto);
		return "boardDetail";
	}//end
	
	
	@RequestMapping("/boardDelete.sp")
	public void boad_delete(HttpServletRequest request,HttpServletResponse response){
		int data=Integer.parseInt(request.getParameter("idx"));
		dao.dbDelete(data);		
		response.setContentType("text/html;charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert(\"���������� �����߽��ϴ�\");");
			out.println("location.href(\"boardList.sp\");");
			out.println("</script>");
		}catch (Exception e) {
			System.out.println("�������� : "+e);
		}
	}
	
	@RequestMapping("/boardEdit.sp")
	public String board_edit(HttpServletRequest request, Model model) {
		int data=Integer.parseInt(request.getParameter("idx"));
		BoardDTO dto = dao.dbDetail(data);
		model.addAttribute("dto",dto);
		return "boardEdit";
	}
	
	@RequestMapping("/boardEditSave.sp")
	public String board_edit(BoardDTO dto) {
		if(dto.getUpload_f().getOriginalFilename().equals("")) {
			dto.setImg_file_name(dto.getDefault_f());
		}else {
			String path = application.getRealPath("./resources/upload");
			String img = dto.getUpload_f().getOriginalFilename();
			File file = new File(path, img); //input type="file" name="upload_f"
			try{ dto.getUpload_f().transferTo(file); }catch(Exception ex){  }  
			dto.setImg_file_name(img); 
		}
		dao.dbUpdate(dto);
		return "redirect:/boardList.sp";
	}
	
	@RequestMapping("/download")
	public String board_download(HttpServletRequest request, HttpServletResponse response) {		
		int code = Integer.parseInt(request.getParameter("idx"));
		try {
			String fname=request.getParameter("fname");			
			String path = application.getRealPath("./resources/upload");			
			File file = new File(path, fname);			
			response.setHeader("Content-Disposition", "attachment;filename="+fname);
			InputStream is  = new FileInputStream(file);
			OutputStream os = response.getOutputStream();
			byte[] bt = new byte[(int)file.length()];
			is.read(bt, 0, bt.length);
			os.write(bt);
			is.close();
			os.close();
		}
		catch (Exception e) {
			System.out.println("��������"+e);
		}
		return "redirect:/boardDetail.sp?idx="+code;
	}
	
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


