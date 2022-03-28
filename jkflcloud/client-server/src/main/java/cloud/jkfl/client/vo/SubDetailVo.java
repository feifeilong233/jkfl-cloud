package cloud.jkfl.client.vo;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

@Data
public class SubDetailVo {
    /**
     * 问题的id
     */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    private Integer iqScore;
    private Integer saqScore;
    private Integer pqScore;

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
     * 问题的答案,选项的id组成的数组
     */
    private String answer;
}
