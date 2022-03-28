/***********************************************************
 * @Description : 考试表，要有题目、总分数、时间限制、有效日期、创建者等字段
 * @author      : jkfl


 ***********************************************************/

package cloud.jkfl.client.vo;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ExamVo {
    @JsonProperty("id")
    @JsonSerialize(using = ToStringSerializer.class)
    private Long examId;
    @JsonProperty("name")
    private String examSource;
    @JsonProperty("desc")
    private String examDescription;
    @JsonProperty("score")
    private Integer examTotalScore;
    /**
     * 考试限制的时间，单位为分钟
     */
    @JsonProperty("elapse")
    private Integer examTotalTime;

    @JsonProperty("radios")
    private List<ExamQuestionSelectVo> examQuestionSelectVoRadioList;
    @JsonProperty("checks")
    private List<ExamQuestionSelectVo> examQuestionSelectVoCheckList;
    @JsonProperty("judges")
    private List<ExamQuestionSelectVo> examQuestionSelectVoJudgeList;
    @JsonProperty("radioScore")
    private Integer examScoreRadio;
    @JsonProperty("checkScore")
    private Integer examScoreCheck;
    @JsonProperty("judgeScore")
    private Integer examScoreJudge;
    /**
     * 考试的创建人，根据id从用户表中查取姓名
     */
    @JsonProperty("creator")
    private String paperTeacherName;
    /**
     * 开始时间
     */
    @JsonProperty("startDate")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date examStartDate;
    /**
     * 结束时间
     */
    @JsonProperty("endDate")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date examEndDate;

    /**
     * 创建时间
     */
    @JsonProperty("createTime")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;
    /**
     * 更新时间
     */
    @JsonProperty("updateTime")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;
}
