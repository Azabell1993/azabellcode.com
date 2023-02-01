package com.azabellcode.start.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MapDto {
   private String name;
   private Long age;
  
   @Override
   public String toString() {
       return "TestDto [name=" + name + ", age=" + age + "]";
   }
}
