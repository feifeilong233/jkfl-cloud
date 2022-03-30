package cloud.jkfl.examservice.mapper;

import cloud.jkfl.examservice.pojo.MultipleQuestion;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;


@Mapper
public interface MultipleQuestionMapper extends BaseMapper<MultipleQuestion> {

    @Select("select mq_id from multiple_question where mq_subject = #{subject} order by rand() desc limit #{multipleNumber}")
    List<Long> findBySubject(String subject, Integer multipleNumber);


    @Select("select * from multiple_question where mq_id in (select paper_question_id from paper_manage where paper_question_type = 2 and paper_id = #{id})")
    List<MultipleQuestion> findByIdAndType(Long id);


    @Select("<script>" +
            "select * from multiple_question where mq_subject like concat('%',#{value},'%')" +
            "</script>")
    List<MultipleQuestion> getListWithValue(String value);
}
