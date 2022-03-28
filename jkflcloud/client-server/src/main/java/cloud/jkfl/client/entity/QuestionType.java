/***********************************************************
 * @Description : 题目类型表，从功能角度划分，比如单选、多选、判断等
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.entity;


import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Data
@Entity
public class QuestionType {
    @Id
    @GeneratedValue
    @JsonProperty("id")
    private Integer questionTypeId;

    @JsonProperty("name")
    private String questionTypeName;

    @JsonProperty("description")
    private String questionTypeDescription;
}
