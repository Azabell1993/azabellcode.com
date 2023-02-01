package com.azabellcode.start.dto;

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
public class DateDto {
    private int date;
   
    @Override
    public String toString() {
        return "TestDto [date=" + date + "]";
    }
}
