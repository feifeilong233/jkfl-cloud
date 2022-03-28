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
public class InputQuestion {
    @Id
    @JsonSerialize(using = ToStringSerializer.class)
    private Long iqId;

    @ApiModelProperty(value = "考试科目")
    private String iqSubject;


    @ApiModelProperty(value = "题干")
    private String iqQuestion;

    @ApiModelProperty(value = "答案")
    private String iqAnswer;

    @ApiModelProperty(value = "解析")
    private String iqAnalysis;

    private Integer iqScore;

    @ApiModelProperty(value = "题目难度等级")
    private String iqLevel;

    @ApiModelProperty(value = "所属章节")
    private String iqSection;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;
}
