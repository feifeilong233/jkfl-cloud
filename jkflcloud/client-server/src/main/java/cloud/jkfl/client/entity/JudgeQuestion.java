/***********************************************************
 * @Description : 考试题目表
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
import java.util.Date;

@Data
@Entity
@DynamicUpdate
public class JudgeQuestion {
    @Id
    @JsonSerialize(using = ToStringSerializer.class)
    private Long jqId;

    @ApiModelProperty(value = "考试科目")
    private String jqSubject;

    @ApiModelProperty(value = "题干")
    private String jqQuestion;

    private String jqAnswer;

    private String jqAnalysis;

    private Integer jqScore;

    @ApiModelProperty(value = "题目难度")
    private String jqLevel;

    @ApiModelProperty(value = "所属章节")
    private String jqSection;

    private Integer version;
    private Integer deleted;

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
