package net.hb.crud.reply;

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
public class BoardReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardReplyController.class);

	@Autowired
	BoardReplyDAO dao; 
	
	
	@RequestMapping("/reply.sp")
	public String reply_select(Model model, @RequestParam(value="hobby_idx") int idx) {
		List <BoardReplyDTO> rLG = dao.dbSelect(idx);
		model.addAttribute("rLG",rLG);

		return "board_reply";
	}
	
	
	@RequestMapping("/boardreply.sp")
	public String reply_insert(BoardReplyDTO dto,@RequestParam(value="hobby_idx") int idx) {
		dao.dbInsert(dto);
		return "redirect:/boardDetail.sp?idx="+idx;
	}
	
	@RequestMapping("/boardreply_delete.sp")
	public String reply_delete(@RequestParam(value="Ridx") int Ridx, @RequestParam(value="idx") int idx, BoardReplyDTO dto) {
		dao.dbDelete(Ridx);
		return "redirect:/boardDetail.sp?idx="+idx;
	}
	
	@RequestMapping("/boardreply_edit.sp")
	public String reply_update(@RequestParam(value="rhobby_idx") int Ridx, @RequestParam(value="rwriter") String Rwriter, @RequestParam(value="rmemo") String Rmemo,
			@RequestParam(value="hobby_idx") int idx, BoardReplyDTO dto) {
		dto.setHobby_idx(idx);
		dto.setRhobby_idx(Ridx);
		dto.setRmemo(Rmemo);
		dto.setRwriter(Rwriter);
		dao.dbUpdate(dto);
		return "redirect:/boardDetail.sp?idx="+idx;
	}
	
}//BoardController class END


