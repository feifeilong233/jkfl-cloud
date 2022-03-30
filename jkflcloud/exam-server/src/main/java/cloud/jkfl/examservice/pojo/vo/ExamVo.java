package cloud.jkfl.examservice.pojo.vo;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExamVo {

    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    private String className;

    private String examType;

    private String paperId;

    private String examDescription;

    private String examTips;

    private Date beginTime;

    private Date endTime;

}
