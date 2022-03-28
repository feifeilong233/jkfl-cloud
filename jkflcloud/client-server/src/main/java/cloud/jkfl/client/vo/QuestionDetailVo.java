/***********************************************************
 * @Description : 问题详情的实体类
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.vo;

import cloud.jkfl.client.entity.QuestionOption;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import io.swagger.models.auth.In;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class QuestionDetailVo {
    /**
     * 问题的id
     */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    private Integer sqScore;
    private Integer mqScore;
    private Integer jqScore;

    /**
     * 考试题目
     */
    private String name;

    /**
     * 考试描述
     */
    private String description;
    /**
     * 问题的类型
     */
    private String type;
    /**
     * 问题的选项
     */
    private List<QuestionOption> options;
    /**
     * 问题的答案,选项的id组成的数组
     */
    private List<String> answers = new ArrayList<>();
}
