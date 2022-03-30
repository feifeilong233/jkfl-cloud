package cloud.jkfl.examservice.mapper;

import cloud.jkfl.examservice.pojo.SelectQuestion;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface SelectQuestionMapper extends BaseMapper<SelectQuestion> {

    @Select("select `sq_id` from `select_question` order by `sq_id` desc limit 1")
    public SelectQuestion findOnlyQuestionId();


    @Select("select * from select_question where sq_id in (select paper_question_id from paper_manage where paper_question_type = 1 and paper_id = #{paperId})")
    List<SelectQuestion> findByIdAndType(Long paperId);


    @Select("select sq_id from select_question where sq_subject = #{subject} order by rand() desc limit #{selectNumber}")
    List<Long> findBySubject(String subject, Integer selectNumber);


    @Select("<script>" +
            "select * from select_question where sq_subject like concat('%',#{value},'%')" +
            "</script>")
    List<SelectQuestion> getListWithValue(String value);
}
