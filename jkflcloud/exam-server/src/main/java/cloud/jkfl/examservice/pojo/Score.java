package cloud.jkfl.examservice.pojo;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Score {

    @TableId(value = "score_id", type = IdType.ASSIGN_ID)
    private Long id;

    @ApiModelProperty(value = "考试编号")
    @TableField(value = "exam_id")
    private Long examId;

    @TableField(value = "stu_id")
    @ApiModelProperty(value = "学号")
    private Long stuId;

    @TableField(value = "score_subject")
    private String subject;

    @TableField(value = "score_ptScore")
    private Integer ptScore;

    @TableField(value = "score_etScore")
    private Integer etScore;

    @TableField(value = "score_total_score")
    private Integer totalScore;

    @TableField(value = "score_answer_time")
    private Data answerTime;

    @TableField(value = "score_create_time", fill = FieldFill.INSERT)
    private Date createTime;

    @TableField(value = "score_update_time",fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @TableField(value = "score_version", fill = FieldFill.INSERT)
    @Version
    private Integer version;

    @TableField(value = "score_deleted", fill = FieldFill.INSERT)
    @TableLogic
    private Integer deleted;

}
