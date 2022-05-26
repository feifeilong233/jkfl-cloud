package xion.boot.online.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.shiro.crypto.hash.Hash;
import xion.boot.online.pojo.TbCheckin;

import java.util.ArrayList;
import java.util.HashMap;

@Mapper
public interface TbCheckinDao {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(TbCheckin record);

    TbCheckin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TbCheckin record);

    int updateByPrimaryKey(TbCheckin record);

    public abstract Integer haveCheckin(HashMap param);

    public abstract void insert(TbCheckin checkin);

    public abstract HashMap searchTodayCheckin(int userId);

    public abstract long searchCheckinDays(int userId);

    public abstract ArrayList<HashMap> searchWeekCheckin(HashMap param);
}