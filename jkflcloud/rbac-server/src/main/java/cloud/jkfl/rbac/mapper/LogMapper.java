package cloud.jkfl.rbac.mapper;

import cloud.jkfl.rbac.pojo.Log;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface LogMapper extends BaseMapper<Log> {

    @Select("select * from log where deleted = 0 order by createTime desc")
    public abstract List<Log> getAllLog();

}
