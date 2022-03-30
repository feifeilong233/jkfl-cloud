package cloud.jkfl.examservice.mapper;

import cloud.jkfl.examservice.pojo.Score;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ScoreMapper extends BaseMapper<Score> {


    /**
     * 取平均成绩作为etScore
     * @param examId
     * @return
     */
    @Select("select avg(score_etScore) as etScore from score where exam_id = #{examId} group by stu_id")
    List<Score> findByExamId(Long examId);
}
