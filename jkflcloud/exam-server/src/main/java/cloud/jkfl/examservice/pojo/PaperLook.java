package cloud.jkfl.examservice.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 此类是paper_manage的伴生表，
 * 此表为教师端--试卷管理模块定制，
 * 由于决定将组建考试和制作试卷分开，所以在组建考试时候可以选择已有的paper进行考试
 * 即可以在exam组建界面直接使用paper_look的数据来定制考试。
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaperLook {

    @JsonSerialize(using = ToStringSerializer.class)
    @TableId(value = "paper_look_id", type = IdType.ASSIGN_ID)
    private Long paperLookId;

    @TableField(value = "paper_id")
    private Long paperId;

    @TableField(value = "paper_look_title")
    private String paperLookTitle;

    @TableField(value = "paper_look_time")
    private Integer paperLookTime;

    @TableField(value = "paper_look_score")
    private Integer paperLookScore;

    @TableField(value = "paper_teacher_name")
    private String paperTeacherName;

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



}
