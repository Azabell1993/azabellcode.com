package com.azabellcode.start.dto;

import lombok.Data;

@Data
public class BoardDto {
    /*
        CREATE TABLE board(
            board_idx           INT                 NOT NULL AUTO_INCREMENT     COMMENT '번호(PK)',
            title               VARCHAR(100)        NOT NULL                    COMMENT '제목',
            contents             VARCHAR(3000)       NOT NULL                    COMMENT '내용',
            creater_id          VARCHAR(20)         NOT NULL                    COMMENT '작성자',
            hit_cnt             INT                 NOT NULL DEFAULT 0          COMMENT '조회 수',
            notice_yn           ENUM('Y','N')       NOT NULL DEFAULT 'N'        COMMENT '공지글 여부',
            secret_yn           ENUM('Y','N')       NOT NULL DEFAULT 'N'        COMMENT '비밀글 여부',
            updated_datetime    DATETIME            DEFAULT NULL                COMMENT '수정시간',
            delete_yn           ENUM('Y','N')       NOT NULL DEFAULT 'N'        COMMENT '삭제 여부',
            board_file          LONGBLOB                                        COMMENT '첨부파일',
            created_datetime    DATETIME            NOT NULL DEFAULT NOW()      COMMENT '등록일',
            update_time         DATETIME            NULL                        COMMENT '수정일',
            delete_time         DATETIME            NULL                        COMMENT '삭제일',
            PRIMARY KEY(board_idx)
        ) DEFAULT CHARSET=utf8mb4 COMMENT '게시판'
     */
    private int boardIdx;
    private String title;
    private String contents;
    private String createrId;
    private int  hitCnt;
    private String noticeYn;
    private String secretYn;
    private String updatedDatetime;
    private String deleteYn;
    private byte[] boardFile;
    private String createdDatetime;
    private String updateTime;
    private String deleteTime;

    @Override
    public String toString() {
                return "TestDto [board_idx=" + boardIdx + 
                ", title=" + title + 
                ", contents=" + contents + 
                ", createrId=" + createrId + 
                ", hitCnt=" + hitCnt + 
                ", secretYn=" + secretYn + 
                ", updatedDatetime=" + updatedDatetime + 
                ", deleteYn=" + deleteYn + 
                ", boardFile=" + boardFile +
                ", createdDatetime=" + createdDatetime + 
                ", updateTime=" + updateTime + 
                ", deleteTime=" + deleteTime + "]\n";
    }
}
