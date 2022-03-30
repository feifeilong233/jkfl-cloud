package cloud.jkfl.examservice.mapper;

import cloud.jkfl.examservice.pojo.ProgramQuestion;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ProgramQuestionMapper extends BaseMapper<ProgramQuestion> {

    @Select("select pq_id from program_question where pq_subject = #{pgSubject} order by rand() desc limit #{pqNumber}")
    List<Long> findBySubject(String pgSubject, String pqNumber);


    @Select("select * from program_question where pq_id in (select paper_question_id from paper_manage where paper_question_type = 6 and paper_id = #{id})")
    List<ProgramQuestion> findByIdAndType(Long id);


    @Select("<script>" +
            "select * from program_question where pq_subject like concat('%',#{value},'%')" +
            "</script>")
    List<ProgramQuestion> getListWithValue(String value);
}
