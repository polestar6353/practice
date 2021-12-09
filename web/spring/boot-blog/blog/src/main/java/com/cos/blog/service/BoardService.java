package com.cos.blog.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.blog.controller.dto.ReplySaveRequestDto;
import com.cos.blog.model.Board;
import com.cos.blog.model.Reply;
import com.cos.blog.model.User;
import com.cos.blog.repository.BoardRepository;
import com.cos.blog.repository.ReplyRepository;


@Service
public class BoardService {
	
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private ReplyRepository replyRepository;
	
	@Transactional
	public void save(Board board, User user) {
		board.setCount(0);
		board.setUser(user);
		boardRepository.save(board);
	}
	
	@Transactional(readOnly = true)
	public Page<Board> boardList(Pageable pageable){
		return boardRepository.findAll(pageable);
	}
	
	@Transactional(readOnly = true)
	public Board boardDetail(int id) {
		return boardRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패:아이디를 찾을 수 없습니다");
				});
	}
	
	@Transactional
	public void boardDelete(int id) {
		boardRepository.deleteById(id);
	}
	
	@Transactional
	public void boardUpdate(int id,Board requestBoard) {
		Board board = boardRepository.findById(id).
				orElseThrow(()->{
			return new IllegalArgumentException("글 찾기 실패:아이디를 찾을 수 없습니다");
		}); //영속화 완료
		board.setTitle(requestBoard.getTitle());
		board.setContent(requestBoard.getContent());
		//해당 함수 종료시(Service가 종료될 떄)트랜잭션이 종료. 이때 더티체킹
	}
	
	@Transactional
	public void replySave(User user, int boardId ,Reply requestReply) {
		
		Board board = boardRepository.findById(boardId).orElseThrow(()->{
			return new IllegalArgumentException("댓글 쓰기 실패:게시글 id를 찾을 수 없습니다");
		});
		
		requestReply.setUser(user);
		requestReply.setBoard(board);
		
		//replyRepository.msave(replySaveRequestDto.getUserId(),replySaveRequestDto.getBoardId(),replySaveRequestDto.getcontent());
		//만일 네이티브 쿼리를 이용한다면 위의 영속화나 set, 아래의 save함수 호출 필요 없이
		//이 한줄로도 가능하다. 물론 이 replySave메소드의 인자로 ReplySaveRequstDto replySaveRequestDto 를 받아야 한다
		
		
		replyRepository.save(requestReply);
		
	}
	
	
	@Transactional
	public void replyDelete(int replyId) {
		replyRepository.deleteById(replyId);
	}
	
	
}

