package cloud.jkfl.examservice.pojo.vo;

import cloud.jkfl.examservice.pojo.ProgramQuestion;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProgramQuestionVo {
    private List<ProgramQuestion> list;

}
