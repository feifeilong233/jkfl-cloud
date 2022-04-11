/***********************************************************
 * @Description : 考试表，要有题目、总分数、时间限制、有效日期、创建者等字段
 * @author      : jkfl


 ***********************************************************/

package cloud.jkfl.client.entity;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "exam_manage")
@Data
@DynamicUpdate
public class Exam {
    @Id
    @JsonSerialize(using = ToStringSerializer.class)
    private Long examId;
    private String examDescription;
    @ApiModelProperty(value = "考试名称，同name")
    private String examSource;
    @ApiModelProperty("外键，试卷表的id")
    private Long paperId;
    @ApiModelProperty(value = "考试日期，不是创建修改日期，需要手动添加！")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date examDate;
    @ApiModelProperty(value = "考试总时间， int类型， 小于三位！")
    private Integer examTotalTime;
    @ApiModelProperty(value = "总分")
    private Integer examTotalScore;
    @ApiModelProperty(value = "考试类型 ")
    private String examType;
    @ApiModelProperty(value = "考生须知")
    private String examTips;

    private Integer deleted;
    private Integer version;
    private Long clazzId;
    /**
     * 创建时间, 设计表时设置了自动插入当前时间，无需在Java代码中设置了
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;
    /**
     * 更新时间，设计表时设置了自动插入当前时间，无需在Java代码中设置了。
     * 同时@DynamicUpdate注解可以时间当数据库数据变化时自动更新，无需人工维护
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;
}
