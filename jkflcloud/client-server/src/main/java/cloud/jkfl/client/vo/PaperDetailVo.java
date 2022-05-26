/***********************************************************
 * @Description : 问题详情的实体类
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.vo;

import cloud.jkfl.client.entity.*;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

import java.util.List;

@Data
public class PaperDetailVo {
    String name;
    List<SelectQuestion> sqList;
    List<MultipleQuestion> mqList;
    List<JudgeQuestion> jqList;
    List<InputQuestion> iqList;
    List<ShortAnswerQuestion> saqList;
    List<ProgramQuestion> pqList;
}
