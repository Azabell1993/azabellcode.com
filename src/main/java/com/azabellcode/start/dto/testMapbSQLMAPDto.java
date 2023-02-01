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
public class testMapbSQLMAPDto {
    private String name;
    private String position;
    private String office;
    private int    age;
    private String startdate;
    private String salary;

    @Override
    public String toString() {
        return "TestDto [name=" + name + 
                        ", position=" + position + 
                        ", office=" + office + 
                        ", age =" + age + 
                        ", startdate= " + startdate + 
                        ", salary= " + salary + 
                        "]\n";
    }
}
