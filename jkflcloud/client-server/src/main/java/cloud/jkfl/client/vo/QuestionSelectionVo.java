/***********************************************************
 * @Description : 前端创建问题时的下拉列表选择
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.vo;

import cloud.jkfl.client.entity.QuestionCategory;
import cloud.jkfl.client.entity.QuestionLevel;
import cloud.jkfl.client.entity.QuestionType;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

@Data
public class QuestionSelectionVo {
    @JsonProperty("types")
    private List<QuestionType> questionTypeList;

    @JsonProperty("categories")
    private List<QuestionCategory> questionCategoryList;

    @JsonProperty("levels")
    private List<QuestionLevel> questionLevelList;
}
