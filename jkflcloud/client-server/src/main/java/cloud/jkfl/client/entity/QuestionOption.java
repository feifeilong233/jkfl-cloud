/***********************************************************
 * @Description : 问题的选项，适用于单选、多选和判断
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.entity;


import lombok.Data;
import java.io.Serializable;

@Data
public class QuestionOption implements Serializable {
    private String questionOptionId;
    private String questionOptionContent;
//    private String questionOptionDescription;
    public QuestionOption(String questionOptionId, String questionOptionContent) {
        this.questionOptionContent=questionOptionContent;
        this.questionOptionId=questionOptionId;
    }
}
