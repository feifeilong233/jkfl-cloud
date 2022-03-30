package cloud.jkfl.userservice.mapper;


import cloud.jkfl.userservice.pojo.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserMapper extends BaseMapper<User> {

    @Select("select * from user where user_phone = #{tel}")
    User getStuByTel(Long tel);


    @Select("select * from user where class_id = #{classId}")
    List<User> getListWithClassId(Long classId);


    @Select("<script>" +
            "select * from user where user_nickname like concat('%',#{value},'%')" +
            "</script>")
    List<User> getListWithName(String value);


    @Select("<script>" +
            "select * from user where user_pid like concat('%',#{pid},'%')" +
            "</script>")
    List<User> getListWithPid(Long pid);


    @Select("select * from user where user_nickname=#{text}")
    User getStuByName(String text);


    @Select("select user_id from user where user_pid = #{pid}")
    String getIdWithPid(Long pid);
}
