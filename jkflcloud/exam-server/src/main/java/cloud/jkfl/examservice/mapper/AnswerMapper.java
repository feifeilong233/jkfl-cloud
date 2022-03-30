package cloud.jkfl.examservice.mapper;

import cloud.jkfl.examservice.pojo.vo.AnswerQuery;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface AnswerMapper {

    @Select("select sq_question as question, sq_subject as subject, sq_score as score, sq_section as section, sq_level as level, \"选择\" as type from select_question" +
            "union" +
            "select jq_question as question, jq_subject as subject, jq_score as score, jq_section as section, jq_level as level, \"判断\" as type from judge_question" +
            "union" +
            "select iq_question as question, iq_subject as subject, iq_score as score, iq_section as section, iq_level as level, \"填空\" as type from input_question")
    IPage<AnswerQuery> findAll(Page page);


}
