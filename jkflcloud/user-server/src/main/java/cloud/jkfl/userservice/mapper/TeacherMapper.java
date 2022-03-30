package cloud.jkfl.userservice.mapper;

import cloud.jkfl.userservice.pojo.Teacher;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface TeacherMapper extends BaseMapper<Teacher> {


    @Select("select * from teacher where tea_tel = #{tel}")
    Teacher getTeaByTel(Long tel);
}
