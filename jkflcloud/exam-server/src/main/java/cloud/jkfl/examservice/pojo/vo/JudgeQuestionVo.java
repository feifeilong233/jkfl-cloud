package cloud.jkfl.examservice.pojo.vo;

import cloud.jkfl.examservice.pojo.JudgeQuestion;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JudgeQuestionVo {
    private List<JudgeQuestion> list;
}
