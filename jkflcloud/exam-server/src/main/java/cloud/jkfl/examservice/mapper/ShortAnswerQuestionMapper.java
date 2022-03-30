package cloud.jkfl.examservice.mapper;

import cloud.jkfl.examservice.pojo.ShortAnswerQuestion;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ShortAnswerQuestionMapper extends BaseMapper<ShortAnswerQuestion> {

    @Select("select saq_id from short_answer_question where saq_subject = #{saqSubject} order by rand() desc limit #{saqNumber}")
    List<Long> findBySubject(String saqSubject, Integer saqNumber);


    @Select("select * from short_answer_question where saq_id in (select paper_question_id from paper_manage where paper_question_type = 5 and paper_id = #{id})")
    List<ShortAnswerQuestion> findByIdAndType(Long id);


    @Select("<script>" +
            "select * from short_answer_question where saq_subject like concat('%',#{value},'%')" +
            "</script>")
    List<ShortAnswerQuestion> getListWithValue(String value);
}
