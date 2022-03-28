package cloud.jkfl.rbac.mapper;

import cloud.jkfl.rbac.pojo.Teacher;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface TeacherMapper extends BaseMapper<Teacher> {


    @Select("<script>" +
            "select * from teacher" +
            "<where> " +
            "<foreach collection='paramMap' index='key' item='value' open='(' separator='OR' close=')'> " +
            "(tea_school = #{key} and tea_academy in " +
            "<foreach collection='value' item='academy' separator=',' open='(' close=')'> " +
            "#{academy} " +
            "</foreach> " +
            ") " +
            "</foreach> " +
            "</where>" +
            "</script>")
    List<Teacher> getSelectList(@Param("paramMap") Map<String,List<String>> paramMap);
}
