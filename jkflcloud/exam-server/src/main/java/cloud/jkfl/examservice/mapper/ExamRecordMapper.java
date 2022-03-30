package cloud.jkfl.examservice.mapper;

import cloud.jkfl.examservice.pojo.ExamRecord;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ExamRecordMapper extends BaseMapper<ExamRecord> {


    /**
     * exam_sub_score = -1就是每阅的，阅了的话，否则阅了至少也是0,
     * 全取出来，前端判断是否重阅！
     * */
    @Select("select * from exam_record where exam_id = #{id}")
    List<ExamRecord> getRecordsWithExamId(Long id);


    @Select("select * from exam_record where exam_joiner_id = #{joiner_id}")
    ExamRecord getRecordWithJoinerId(String joiner_id);
}
