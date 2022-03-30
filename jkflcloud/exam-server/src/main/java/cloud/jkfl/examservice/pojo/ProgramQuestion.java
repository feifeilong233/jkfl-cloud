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
public class ProgramQuestion {

    @JsonSerialize(using = ToStringSerializer.class)
    @TableId(value = "pq_id",type = IdType.ASSIGN_ID)
    private Long pqId;

    @TableField(value = "pq_subject")
    private String pqSubject;

    @TableField(value = "pq_question")
    private String pqQuestion;

    @TableField(value = "pq_analysis")
    private String pqAnalysis;

    @TableField(value = "pq_score")
    private Integer pqScore;

    @TableField(value = "pq_level")
    private String pqLevel;

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
