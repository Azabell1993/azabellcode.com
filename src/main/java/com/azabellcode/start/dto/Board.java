package com.azabellcode.start.dto;

import java.time.LocalDateTime;

import groovy.transform.builder.Builder;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Board {
    private Long            idx;
    private String          title;
    private String          content;
    private LocalDateTime   createdDate;
    private String          password;
    @Override
    public String toString() {
        return "TestDto [idx=" + idx + 
                        ", title=" + title + 
                        ", content=" + content + 
                        ", createdDate =" + createdDate + 
                        ", password= " + password + 
                        "]\n";
    }
}
