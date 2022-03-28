package cloud.jkfl.examservice.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Checkin {

    private Long checkinId;

    private String gradeId;
    private String pointName;
    private Integer pointId;
    private String subjectId;

}
