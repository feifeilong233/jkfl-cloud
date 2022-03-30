package cloud.jkfl.examservice.pojo;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Checkin {

    @JsonSerialize(using = ToStringSerializer.class)
    private Long checkinId;

    private String gradeId;
    private String pointName;
    private Integer pointId;
    private String subjectId;

}
