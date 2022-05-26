package xion.boot.online.dao;

import org.apache.ibatis.annotations.Mapper;
import xion.boot.online.pojo.TbFaceModel;

@Mapper
public interface TbFaceModelDao {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(TbFaceModel record);

    TbFaceModel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TbFaceModel record);

    int updateByPrimaryKey(TbFaceModel record);

    public abstract String searchFaceModel(int userId);

    public abstract void insert(TbFaceModel faceModel);

    public abstract int deleteFaceModel(int userId);
}