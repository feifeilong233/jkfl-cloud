package xion.boot.online.service;

import xion.boot.online.pojo.TbUser;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

public interface UserService {

    public abstract int registerUser(String register, String code, String nickname, String photo);

    public abstract Set<String> searchUserPermissions(int userId);

    public abstract Integer login(String code);

    public abstract ArrayList<HashMap> searchUserGroupByDept(String keyword);

    public abstract ArrayList<HashMap> searchMembers(List param);

    public abstract TbUser searchById(int userId);

    public abstract String searchUserHiredate(int userId);

    public abstract HashMap searchUserSummary(int userId);

}
