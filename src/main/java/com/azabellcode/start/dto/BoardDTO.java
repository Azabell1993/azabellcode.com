package com.azabellcode.start.dto;

import groovy.transform.builder.Builder;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardDTO {
	private Long 			idx;			    //글번호(PK)
	private String 			title;		        //제목
	private String 			content;		    //내용
	private String 			writer;		        //작성자
	private int 			viewCnt;		    //조회수
	private String 			noticeYn;	        //공지 여부
	private String 			secretYn;	        //비밀글 여부
	private String 			deleteYn;	        //삭제 여부
	private LocalDateTime 	insertTime;			//등록일
	private LocalDateTime 	updateTime;			//수정일
	private LocalDateTime 	deleteTime;			//삭제일

	@Override
    public String toString() {
        return "TestDto [  idx=" 			+ idx + 
                        ", title=" 			+ title + 
                        ", content=" 		+ content + 
                        ", writer =" 		+ writer + 
                        ", viewCnt= " 		+ viewCnt + 
                        ", noticeYn= " 		+ noticeYn + 
                        ", secretYn= " 		+ secretYn + 
                        ", deleteYn= " 		+ deleteYn + 
                        ", insertTime= " 	+ insertTime + 
                        ", updateTime= " 	+ updateTime + 
                        ", deleteTime= " 	+ deleteTime + 
                        "]\n";
    }
}











