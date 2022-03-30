package cloud.jkfl.examservice.pojo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.Version;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 试卷
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaperManage {

    @JsonSerialize(using = ToStringSerializer.class)
    @ApiModelProperty(value = "这个玩意不是主键！！！这个表是连接的没有主键！！！这个id是可以重复的")
    @TableField(value = "paper_id")
    private Long paperId;

    @TableField(value = "paper_question_type")
    @ApiModelProperty(value = "题目类型")
    private Integer paperQuestionType;


    @TableField(value = "paper_question_id")
    @ApiModelProperty(value = "题目编号")
    @JsonSerialize(using = ToStringSerializer.class)
    private Long paperQuestionId;

    @TableField(value = "create_time",fill = FieldFill.INSERT)
    private Date createTime;

    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @TableField(value = "version", fill = FieldFill.INSERT)
    @Version
    private Integer version;

    @TableField(value = "deleted", fill = FieldFill.INSERT)
    @TableLogic
    private Integer deleted;


    public PaperManage(Long paperId, int type, Long questionId) {
        this.paperId = paperId;
        this.paperQuestionType = type;
        this.paperQuestionId = questionId;
    }
}
