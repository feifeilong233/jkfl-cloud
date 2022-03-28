/***********************************************************
 * @Description : 按照单选、多选和判断题返回对应的问题列表
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

@Data
public class ExamQuestionTypeVo {
    @JsonProperty("radios")
    private List<ExamQuestionSelectVo> examQuestionSelectVoRadioList;

    @JsonProperty("checks")
    private List<ExamQuestionSelectVo> examQuestionSelectVoCheckList;

    @JsonProperty("judges")
    private List<ExamQuestionSelectVo> examQuestionSelectVoJudgeList;
}
