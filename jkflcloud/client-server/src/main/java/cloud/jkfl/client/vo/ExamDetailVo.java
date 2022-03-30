/***********************************************************
 * @Description : 考试详情的实体类
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.vo;

import cloud.jkfl.client.entity.Exam;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

import java.util.List;

@Data
public class ExamDetailVo {
    /**
     * 考试的基本信息对象
     */
    private Exam exam;

    /**
     * 单选题的id数组
     */
    private String[] radioIds;

    /**
     * 多选题的id数组
     */
    private String[] checkIds;

    /**
     * 判断题的id数组
     */
    private String[] judgeIds;

    private List<Long> iqIds;

    private List<Long> saqIds;

    private List<Long> pqIds;

}
