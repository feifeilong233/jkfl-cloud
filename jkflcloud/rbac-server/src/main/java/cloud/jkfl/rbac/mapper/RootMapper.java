package cloud.jkfl.rbac.mapper;

import cloud.jkfl.rbac.pojo.Root;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface RootMapper extends BaseMapper<Root> {

    @Select("select * from admin where admin_tel = #{tel,jdbcType=BIGINT}")
    Root getAdminByTel(Long tel);
}
