package cloud.jkfl.examservice.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExamManage {

    @JsonSerialize(using = ToStringSerializer.class)
    @TableId(value = "exam_id", type = IdType.ASSIGN_ID)
    private Long examId;

    @TableField(value = "exam_description")
    private String examDescription;

    @TableField(value = "exam_source")
    @ApiModelProperty(value = "考试名称，同name")
    private String examSource;

    @JsonSerialize(using = ToStringSerializer.class)
    @TableField(value = "paper_id")
    @ApiModelProperty("外键，试卷表的id")
    private Long paperId;

    @TableField(value = "exam_date")
    @ApiModelProperty(value = "考试日期，不是创建修改日期，需要手动添加！")
    private Date examDate;

    @TableField(value = "exam_total_time")
    @ApiModelProperty(value = "考试总时间， int类型， 小于三位！")
    private Integer examTotalTime;

    @TableField(value = "exam_grade")
    @ApiModelProperty(value = "年级")
    private String examGrade;

    @TableField(value = "exam_term")
    @ApiModelProperty(value = "学期")
    private String examTerm;

    @TableField(value = "exam_major")
    @ApiModelProperty(value = "专业")
    private String examMajor;

    @TableField(value = "exam_institute")
    @ApiModelProperty(value = "学院")
    private String examInstitute;


    @TableField(value = "exam_total_score")
    @ApiModelProperty(value = "总分")
    private Integer examTotalScore;

    @TableField(value = "exam_type")
    @ApiModelProperty(value = "考试类型 ")
    private String examType;


    @TableField(value = "exam_tips")
    @ApiModelProperty(value = "考生须知")
    private String examTips;

    @TableField(value = "create_time",fill = FieldFill.INSERT)
    private Date createTime;

    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @TableField(value = "deleted", fill = FieldFill.INSERT)
    @TableLogic
    private Integer deleted;

    @TableField(value = "version",fill = FieldFill.INSERT)
    @Version
    private Integer version;

    @JsonSerialize(using = ToStringSerializer.class)
    @TableField(value = "clazz_id")
    private Long clazzId;


}
