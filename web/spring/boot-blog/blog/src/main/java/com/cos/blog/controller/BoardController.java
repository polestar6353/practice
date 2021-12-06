package com.cos.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.blog.config.auth.PrincipalDetail;
import com.cos.blog.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	//@AuthenticationPrincipal PrincipalDetail principal 을 인자로 주고 principal.getUsername()등으로 컨트롤러 단에서 확인 가능
	@GetMapping({"","/"})
	public String index(Model model,@PageableDefault(size=3,sort="id",direction=Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("boards",boardService.boardList(pageable));
		return "index";
	}
	
	//USER권한이 필요
	@GetMapping("/board/saveForm")
	public String saveForm() {
		return "board/saveForm";
	}
	
	@GetMapping("/board/{id}")
	public String findById(@PathVariable int id, Model model) {
		model.addAttribute(boardService.boardDetail(id));
		return "board/detail";
	}
	
	
	
}
