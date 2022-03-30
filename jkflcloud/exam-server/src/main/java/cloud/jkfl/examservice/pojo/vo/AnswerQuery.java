package cloud.jkfl.examservice.pojo.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class AnswerQuery {

    @ApiModelProperty(value = "题干")
    private String question;

    @ApiModelProperty(value = "学科")
    private String subject;

    @ApiModelProperty(value = "分值")
    private String score;

    @ApiModelProperty(value = "难度")
    private String level;

    @ApiModelProperty(value = "类型 1=选择 2=填空 3=判断")
    private String type;


}
