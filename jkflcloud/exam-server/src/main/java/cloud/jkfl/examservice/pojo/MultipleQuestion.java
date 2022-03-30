package cloud.jkfl.examservice.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MultipleQuestion {

    @JsonSerialize(using = ToStringSerializer.class)
    @TableId(value = "mq_id",type = IdType.ASSIGN_ID)
    private Long mqId;

    @TableField(value = "mq_subject")
    private String mqSubject;

    @TableField(value = "mq_question")
    private String mqQuestion;

    @TableField(value = "mq_analysis")
    private String mqAnalysis;

    @TableField(value = "mq_score")
    private Integer mqScore;

    @TableField(value = "mq_level")
    private String mqLevel;

    @TableField(value = "mq_answerA")
    private String mqAnswerA;

    @TableField(value = "mq_answerB")
    private String mqAnswerB;

    @TableField(value = "mq_answerC")
    private String mqAnswerC;

    @TableField(value = "mq_answerD")
    private String mqAnswerD;

    @TableField(value = "mq_answer")
    private String mqAnswer;


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
