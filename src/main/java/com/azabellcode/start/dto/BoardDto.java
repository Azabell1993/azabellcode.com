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
            password          VARCHAR(20)         NOT NULL                      COMMENT '패스워드',
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
    private int boardIdx; // 게시글 번호(PK)
    private String title; // 제목
    private String contents; // 내용
    private String createrId; // 작성자
    private String password; // 패스워드
    private int hitCnt; // 조회수
    private String noticeYn; // 공지 여부
    private String secretYn; // 비밀글 여부
    private String updatedDatetime; // 수정시간
    private String deleteYn; // 삭제 여부
    private byte[] boardFile; // 첨부파일
    private String createdDatetime; // 등록일
    private String updateTime; // 수정일
    private String deleteTime; // 삭제일
    private Integer parentIdx; // 부모 게시글 번호 (답글일 경우)

    @Override
    public String toString() {
        return "BoardDto{" +
                "boardIdx=" + boardIdx +
                ", title='" + title + '\'' +
                ", contents='" + contents + '\'' +
                ", createrId='" + createrId + '\'' +
                ", password='" + password + '\'' +
                ", hitCnt=" + hitCnt +
                ", noticeYn='" + noticeYn + '\'' +
                ", secretYn='" + secretYn + '\'' +
                ", updatedDatetime='" + updatedDatetime + '\'' +
                ", deleteYn='" + deleteYn + '\'' +
                ", createdDatetime='" + createdDatetime + '\'' +
                ", updateTime='" + updateTime + '\'' +
                ", deleteTime='" + deleteTime + '\'' +
                ", parentIdx=" + parentIdx +
                '}';
    }
}