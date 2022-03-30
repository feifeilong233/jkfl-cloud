package cloud.jkfl.rbac.mapper;

import cloud.jkfl.rbac.pojo.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper extends BaseMapper<User> {


    @Select("<script>" +
            "select * from user" +
            "<where> " +
            "<foreach collection='paramMap' index='key' item='value' open='(' separator='OR' close=')'> " +
            "(user_school = #{key} and user_academy in " +
            "<foreach collection='value' item='academy' separator=',' open='(' close=')'> " +
            "#{academy} " +
            "</foreach> " +
            ") " +
            "</foreach> " +
            "</where>" +
            "</script>")
    List<User> getSelectStu(@Param("paramMap") Map<String,List<String>> map);


}
