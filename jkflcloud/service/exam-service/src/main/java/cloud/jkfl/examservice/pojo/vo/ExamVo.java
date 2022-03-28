package cloud.jkfl.examservice.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExamVo {

    private Long id;

    private String className;

    private String examType;

    private String paperId;

    private String examDescription;

    private String examTips;

    private Date beginTime;

    private Date endTime;

}
