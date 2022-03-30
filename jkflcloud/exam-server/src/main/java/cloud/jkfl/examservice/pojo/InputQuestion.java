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
 * 填空题
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class InputQuestion {

    @JsonSerialize(using = ToStringSerializer.class)
    @TableId(value = "iq_id", type = IdType.ASSIGN_ID)
    private Long iqId;

    @TableField(value = "iq_subject")
    @ApiModelProperty(value = "考试科目")
    private String iqSubject;


    @TableField(value = "iq_question")
    @ApiModelProperty(value = "题干")
    private String iqQuestion;

    @TableField(value = "iq_answer")
    @ApiModelProperty(value = "答案")
    private String iqAnswer;

    @TableField(value = "iq_analysis")
    @ApiModelProperty(value = "解析")
    private String iqAnalysis;

    @TableField(value = "iq_score")
    private Integer iqScore;

    @TableField(value = "iq_level")
    @ApiModelProperty(value = "题目难度等级")
    private String iqLevel;

    @TableField(value = "iq_section")
    @ApiModelProperty(value = "所属章节")
    private String iqSection;

    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @TableField(value = "version", fill = FieldFill.INSERT)
    @Version
    private Integer version;

    @TableField(value = "deleted", fill = FieldFill.INSERT)
    @TableLogic
    private Integer deleted;


}
