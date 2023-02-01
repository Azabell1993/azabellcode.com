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
public class MembertblDto {
    private String MEMBER_ID;
	private String MEMBER_PW;
	private String MEMBER_GR;
	private String MEMBER_NICKNAME;
	private String MEMBER_BIRTH;
	private String MEMBER_ADDR;
	private String MEMBER_EMAIL;
	private String MEMBER_INFONUM;
	private String MEMBER_JOINDATE;
	private String MEMBER_BLACKYN;
	private String MEMBER_EVENTQTY;

    @Override
    public String toString() {
        return "TestDto [MEMBER_ID=" + MEMBER_ID + 
                        ", MEMBER_PW=" + MEMBER_PW + 
                        ", MEMBER_GR=" + MEMBER_GR + 
                        ", MEMBER_NICKNAME =" + MEMBER_NICKNAME + 
                        ", MEMBER_BIRTH= " + MEMBER_BIRTH + 
                        ", MEMBER_ADDR= " + MEMBER_ADDR + 
                        ", MEMBER_EMAIL= " + MEMBER_EMAIL + 
                        ", MEMBER_INFONUM= " + MEMBER_INFONUM + 
                        ", MEMBER_JOINDATE= " + MEMBER_JOINDATE + 
                        ", MEMBER_BLACKYN= " + MEMBER_BLACKYN + 
                        ", MEMBER_EVENTQTY= " + MEMBER_EVENTQTY + 
                        "]\n";
    }
}
