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

@Entity
@Data
@DynamicUpdate
public class PaperManage {
    @ApiModelProperty(value = "这个玩意不是主键！！！这个表是连接的没有主键！！！这个id是可以重复的")
    private Long paperId;

    @ApiModelProperty(value = "题目类型")
    private Integer paperQuestionType;

    @Id
    @ApiModelProperty(value = "题目编号")
    @JsonSerialize(using = ToStringSerializer.class)
    private Long paperQuestionId;

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

    private Integer version;
    private Integer deleted;
}
