/***********************************************************
 * @Description : 问题选项的自定义实体类
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class QuestionOptionVo {
    @JsonProperty("id")
    private String questionOptionId;

    @JsonProperty("content")
    private String questionOptionContent;

    @JsonProperty("answer")
    private Boolean answer = false;

    @JsonProperty("description")
    private String questionOptionDescription;
}
