package cloud.jkfl.examservice.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 选择题
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SelectQuestion{

    @JsonSerialize(using = ToStringSerializer.class)
    @TableId(value = "sq_id",type = IdType.ASSIGN_ID)
    private Long sqId;

    @TableField(value = "sq_subject")
    @ApiModelProperty(value = "考试科目")
    private String sqSubject;


    @TableField(value = "sq_question")
    @ApiModelProperty(value = "题干")
    private String sqQuestion;

    @TableField(value = "sq_answerA")
    @ApiModelProperty(value = "A选项，底下的同理")
    private String sqAnswerA;

    @TableField(value = "sq_answerB")
    private String sqAnswerB;

    @TableField(value = "sq_answerC")
    private String sqAnswerC;

    @TableField(value = "sq_answerD")
    private String sqAnswerD;

    @TableField(value = "sq_answer")
    @ApiModelProperty(value = "标准答案，和上面的ABCD不一样！")
    private String sqAnswer;

    @TableField(value = "sq_analysis")
    private String sqAnalysis;

    @TableField(value = "sq_score")
    private Integer sqScore;

    @TableField(value = "sq_section")
    private String sqSection;

    @TableField(value = "sq_level")
    @ApiModelProperty(value = "题目难度")
    private String sqLevel;

    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @TableField(value = "version", fill=FieldFill.INSERT)
    @Version
    private Integer version;

    @TableField(value = "deleted", fill = FieldFill.INSERT)
    @TableLogic
    private Integer deleted;

}
