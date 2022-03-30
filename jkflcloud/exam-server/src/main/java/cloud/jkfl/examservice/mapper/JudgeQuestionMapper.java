package cloud.jkfl.examservice.mapper;

import cloud.jkfl.examservice.pojo.JudgeQuestion;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface JudgeQuestionMapper extends BaseMapper<JudgeQuestion> {


    @Select("select `jq_id` from `judge_question` order by `jq_id` desc limit 1")
    public JudgeQuestion findOnlyQuestion();


    @Select("select * from judge_question where jq_id in (select paper_question_id from paper_manage where paper_question_type = 3 and paper_id = #{paperId})")
    public List<JudgeQuestion> findByIdAndType(Long paperId);


    @Select("select jq_id from judge_question where jq_subject = #{subject} order by rand() desc limit #{judgeNumber}")
    List<Long> findBySubject(String subject, Integer judgeNumber);


    @Select("<script>" +
            "select * from judge_question where jq_subject like concat('%',#{value},'%')" +
            "</script>")
    List<JudgeQuestion> getListWithValue(String value);
}
