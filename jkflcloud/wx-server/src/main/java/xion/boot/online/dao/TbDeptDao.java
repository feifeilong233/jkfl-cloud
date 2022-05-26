package xion.boot.online.dao;

import org.apache.ibatis.annotations.Mapper;
import xion.boot.online.pojo.TbDept;

import java.util.ArrayList;
import java.util.HashMap;

@Mapper
public interface TbDeptDao {
    int deleteByPrimaryKey(Integer id);

    int insert(TbDept record);

    int insertSelective(TbDept record);

    TbDept selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TbDept record);

    int updateByPrimaryKey(TbDept record);

    public abstract ArrayList<HashMap> searchDeptMembers(String keyword);
}