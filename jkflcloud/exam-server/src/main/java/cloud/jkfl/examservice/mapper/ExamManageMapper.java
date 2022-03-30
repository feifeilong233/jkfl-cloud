package cloud.jkfl.examservice.mapper;

import cloud.jkfl.examservice.pojo.ExamManage;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ExamManageMapper extends BaseMapper<ExamManage> {

    @Select("select paper_id from exam_manage order by paper_id desc limit 1")
    ExamManage findOnlyPaperId();


    @Select("select * from exam_manage where clazz_id = #{classId}")
    ExamManage getExamWithClassId(Long classId);
}
