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
public class SelectQuestion {
    @Id
    @JsonSerialize(using = ToStringSerializer.class)
    private Long sqId;

    @ApiModelProperty(value = "考试科目")
    private String sqSubject;

    @ApiModelProperty(value = "题干")
    private String sqQuestion;

    @ApiModelProperty(value = "A选项，底下的同理")
    private String sqAnswerA;

    private String sqAnswerB;

    private String sqAnswerC;

    private String sqAnswerD;

    @ApiModelProperty(value = "标准答案，和上面的ABCD不一样！")
    private String sqAnswer;

    private String sqAnalysis;

    private Integer sqScore;

    private String sqSection;

    @ApiModelProperty(value = "题目难度")
    private String sqLevel;

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
