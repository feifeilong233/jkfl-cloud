package cloud.jkfl.userservice.mapper;

import cloud.jkfl.userservice.pojo.Class;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ClassMapper extends BaseMapper<Class> {

    @Select("select class_id from class where class_name = #{value}")
    Long getClassIdByName(String value);
}
