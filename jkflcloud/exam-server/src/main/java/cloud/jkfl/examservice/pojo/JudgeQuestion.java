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
 * 判断题
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class JudgeQuestion {

    @JsonSerialize(using = ToStringSerializer.class)
    @TableId(value = "jq_id",type = IdType.ASSIGN_ID)
    private Long jqId;

    @TableField(value = "jq_subject")
    @ApiModelProperty(value = "考试科目")
    private String jqSubject;

    @TableField(value = "jq_question")
    @ApiModelProperty(value = "题干")
    private String jqQuestion;

    @TableField(value = "jq_answer")
    private String jqAnswer;

    @TableField(value = "jq_analysis")
    private String jqAnalysis;

    @TableField(value = "jq_score")
    private Integer jqScore;

    @TableField(value = "jq_level")
    @ApiModelProperty(value = "题目难度")
    private String jqLevel;


    @TableField(value = "jq_section")
    @ApiModelProperty(value = "所属章节")
    private String jqSection;

    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @TableField(value = "version",fill = FieldFill.INSERT_UPDATE)
    @Version
    private Integer version;

    @TableField(value = "deleted",fill = FieldFill.INSERT)
    @TableLogic
    private Integer deleted;

}
