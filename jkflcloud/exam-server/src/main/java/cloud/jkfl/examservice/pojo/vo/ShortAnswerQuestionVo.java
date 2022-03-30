package cloud.jkfl.examservice.pojo.vo;

import cloud.jkfl.examservice.pojo.ShortAnswerQuestion;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShortAnswerQuestionVo {
    private List<ShortAnswerQuestion> list;
}
