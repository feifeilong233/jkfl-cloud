package cloud.jkfl.examservice.mapper;

import cloud.jkfl.examservice.pojo.InputQuestion;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface InputQuestionMapper extends BaseMapper<InputQuestion> {

    @Select("select `iq_id` from `input_question` order by `iq_id` desc limit 1")
    InputQuestion findOnlyQuestionId();


    @Select("SELECT * FROM input_question WHERE iq_id IN (SELECT paper_question_id FROM paper_manage WHERE paper_question_type = 4 AND paper_id = #{paperId})")
    List<InputQuestion> findByIdAndType(Long paperId);


    @Select("select iq_id from input_question where iq_subject = #{subject} order by rand() desc limit #{inputNumber}")
    List<Long> findBySubject(String subject, Integer inputNumber);


    @Select("<script>" +
            "select * from input_question where iq_subject like concat('%',#{value},'%')" +
            "</script>")
    List<InputQuestion> getListWithValue(String value);
}
