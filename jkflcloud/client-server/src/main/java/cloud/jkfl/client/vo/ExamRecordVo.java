/***********************************************************
 * @Description : 考试记录VO
 * @author      : 梁山广(Liang Shan Guang)


 ***********************************************************/
package cloud.jkfl.client.vo;

import cloud.jkfl.client.entity.Exam;
import cloud.jkfl.client.entity.ExamRecord;
import cloud.jkfl.client.entity.User;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

@Data
public class ExamRecordVo {
    /**
     * 当前考试记录对应的考试
     */
    private Exam exam;

    /**
     * 当前考试对应的内容
     */
    private ExamRecord examRecord;

    /**
     * 参加考试的用户信息
     */
    private User user;

    @JsonSerialize(using = ToStringSerializer.class)
    private long examId;
}
