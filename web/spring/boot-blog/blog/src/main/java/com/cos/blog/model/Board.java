package com.cos.blog.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Board {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable=false, length=100)
	private String title;
	
	@Lob //대용량 데이터
	private String content; //섬머노트 라이브러리 <html>태그가 섞여서 디자인이 됨.
	
	private int count; //조회수
	
	@ManyToOne	//Many = Board, User= One
	@JoinColumn(name="userId")
	private User user; //DB는 오브젝트를 저장할 수 없다. 자바는 오브젝트를 저장할 수 있다.
	
	
	@OrderBy("id desc")
	@OneToMany(mappedBy = "board", fetch = FetchType.EAGER, cascade=CascadeType.REMOVE)
	@JsonIgnoreProperties({"board"})//board를 통해 Json으로 내부를 get 호출할때 
									//replys내부에 있는 board는 무시.
									//무한 참조를 방지하기 위해 사용.
									//만일 reply를 직접접근하면 조회가 됨.
	private List<Reply> replys; //양방향 매핑을 하는데 이용. 
	
	@CreationTimestamp
	private Timestamp createDate;
}
