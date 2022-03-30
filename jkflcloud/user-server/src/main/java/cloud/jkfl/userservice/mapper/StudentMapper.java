package cloud.jkfl.userservice.mapper;

import cloud.jkfl.userservice.pojo.Student;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface StudentMapper extends BaseMapper<Student> {


    @Select("select * from student where stu_tel = #{tel}")
    Student getStuByTel(Long tel);


    @Select("select * from student where class_id = #{classId}")
    List<Student> getListWithClassId(Long classId);


    @Select("<script>" +
            "select * from student where stu_name like concat('%',#{value},'%')" +
            "</script>")
    List<Student> getListWithName(String value);


    @Select("<script>" +
            "select * from student where stu_pid like concat('%',#{pid},'%')" +
            "</script>")
    List<Student> getListWithPid(Long pid);


    @Select("select * from student where stu_name=#{text}")
    Student getStuByName(String text);
}
