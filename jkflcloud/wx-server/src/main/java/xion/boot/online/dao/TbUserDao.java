package xion.boot.online.dao;

import org.apache.ibatis.annotations.Mapper;
import xion.boot.online.pojo.TbUser;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

@Mapper
public interface TbUserDao {

    public abstract boolean haveRootUser();

    public abstract int insert(HashMap param);

    public abstract Integer searchIdByOpenId(String openId);

    public abstract Set<String> searchUserPermissions(int userId);

    public abstract ArrayList<HashMap> searchUserGroupByDept(String keyword);

    public abstract ArrayList<HashMap> searchMembers(List param);

    public abstract TbUser searchById(int userId);

    public abstract HashMap searchNameAndDept(int userId);

    public abstract String searchUserHiredate(int userId);

    public abstract HashMap searchUserSummary(int userId);

}