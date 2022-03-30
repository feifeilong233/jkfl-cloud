package cloud.jkfl.examservice.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExamRecord {


    @TableId(value = "exam_record_id", type = IdType.ASSIGN_UUID)
    private String examRecordId;

    @TableField(value = "exam_joiner_id")
    private String examJoinerId;

    @TableField(value = "exam_join_date")
    private Date examJoinDate;

    @TableField(value = "exam_time_cost")
    private Integer examTimeCost;

    @TableField(value = "exam_join_score")
    private Integer examJoinScore;

    @TableField(value = "exam_result_level")
    private Integer examResultLevel;

    @TableField(value = "answer_option_ids")
    private String answerOptionIds;

    @TableField(value = "exam_id")
    @JsonSerialize(using = ToStringSerializer.class)
    private Long examId;

    @TableField(value = "exam_sub_score")
    private Integer examSubScore;

    @TableField(value = "exam_joiner_class")
    @JsonSerialize(using = ToStringSerializer.class)
    private Long examJoinerClass;

    @TableField(value = "exam_input_answer")
    private String examInputAnswer;

    @TableField(value = "exam_short_answer")
    private String examShortAnswer;

    @TableField(value = "exam_program_answer")
    private String examProgramAnswer;

}
