package xion.boot.online.dao;

import org.apache.ibatis.annotations.Mapper;
import xion.boot.online.pojo.TbPermission;

@Mapper
public interface TbPermissionDao {
    int deleteByPrimaryKey(Integer id);

    int insert(TbPermission record);

    int insertSelective(TbPermission record);

    TbPermission selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TbPermission record);

    int updateByPrimaryKey(TbPermission record);
}