package cloud.jkfl.rbac.mapper;

import cloud.jkfl.rbac.pojo.Student;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface StudentMapper extends BaseMapper<Student> {

    @Select("<script>" +
            "select * from student" +
            "<where> " +
            "<foreach collection='paramMap' index='key' item='value' open='(' separator='OR' close=')'> " +
            "(stu_school = #{key} and stu_academy in " +
            "<foreach collection='value' item='academy' separator=',' open='(' close=')'> " +
            "#{academy} " +
            "</foreach> " +
            ") " +
            "</foreach> " +
            "</where>" +
            "</script>")
    List<Student> getSelectStu(@Param("paramMap") Map<String,List<String>> map);

}
