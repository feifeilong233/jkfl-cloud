/***********************************************************
 * @Description : 考试卡片列表
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

import java.util.Date;

@Data
public class ExamCardVo {
    @JsonProperty("id")
    @JsonSerialize(using = ToStringSerializer.class)
    private Long examId;
    @JsonProperty("title")
    private String examSource;
    @JsonProperty("content")
    private String examDescription;
    @JsonProperty("score")
    private Integer examTotalScore;
    /**
     * 考试限制的时间，单位为分钟
     */
    @JsonProperty("elapse")
    private Integer examTotalTime;
    @JsonProperty("date")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date examDate;
}
