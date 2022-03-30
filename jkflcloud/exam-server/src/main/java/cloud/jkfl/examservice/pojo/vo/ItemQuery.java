package cloud.jkfl.examservice.pojo.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 题目
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ItemQuery {

    private String title;

    private Integer total;

    private String time;

    @ApiModelProperty(value = "选择数量")
    private List<SelectVo> selectList;
    //private Integer selectNumber;

    @ApiModelProperty(value = "填空数量")
    private List<InputVo> inputList;
    //private Integer InputNumber;

    @ApiModelProperty(value = "判断数量")
    private List<JudgeVo> judgeList;
    //private Integer JudgeNumber;

    @ApiModelProperty(value = "多选题列表")
    private List<MultipleVo> multipleList;

    @ApiModelProperty(value = "简答题列表")
    private List<ShortAnswerVo> shortAnswerList;

    @ApiModelProperty(value = "程序题列表")
    private List<ProgramVo> programList;

}

