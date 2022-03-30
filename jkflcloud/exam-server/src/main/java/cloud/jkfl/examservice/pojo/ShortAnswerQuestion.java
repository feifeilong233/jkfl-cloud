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
public class ShortAnswerQuestion {

    @JsonSerialize(using = ToStringSerializer.class)
    @TableId(value = "saq_id",type = IdType.ASSIGN_ID)
    private Long saqId;

    @TableField(value="saq_subject")
    private String saqSubject;

    @TableField(value="saq_question")
    private String saqQuestion;

    @TableField(value = "saq_analysis")
    private String saqAnalysis;

    @TableField(value = "saq_score")
    private Integer saqScore;

    @TableField(value = "saq_level")
    private String saqLevel;

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
