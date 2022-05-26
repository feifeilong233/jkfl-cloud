package xion.boot.online.service.Impl;


import cn.hutool.core.util.IdUtil;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import xion.boot.online.dao.TbDeptDao;
import xion.boot.online.dao.TbUserDao;
import xion.boot.online.entity.MessageEntity;
import xion.boot.online.exception.EmosException;
import xion.boot.online.pojo.TbUser;
import xion.boot.online.service.UserService;
import xion.boot.online.task.MessageTask;

import java.util.*;

@Service
@Slf4j
@Scope("prototype")
public class UserServiceImpl implements UserService {

    @Value("${wx.app-id}")
    private String appId;

    @Value("${wx.app-secret}")
    private String appSecret;

    @Autowired
    private TbUserDao userDao;

    @Autowired
    private MessageTask messageTask;

    @Autowired
    private TbDeptDao deptDao;

    private String getOpenId(String code){
        String url = "https://api.weixin.qq.com/sns/jscode2session";
        Map<String, Object> map = new HashMap<>();
        map.put("appid", appId);
        map.put("secret", appSecret);
        map.put("js_code", code);
        map.put("grant_type", "authorization_code");

        String response = HttpUtil.post(url, map);
        JSONObject json = JSONUtil.parseObj(response);
        String openId = json.getStr("openid");
        if (openId == null || openId.length() == 0)
            throw new RuntimeException("临时登陆凭证发生错误");
        return openId;
    }


    @Override
    public int registerUser(String registerCode, String code, String nickname, String photo) {

        if (registerCode.equals("000000")){
            /** 000000代表管理员
             * */
            boolean bool = userDao.haveRootUser();
            if (!bool){
                String openId = getOpenId(code);
                HashMap<String, Object> param = new HashMap<>();
                param.put("openId", openId);
                param.put("nickname", nickname);
                param.put("photo", photo);
                param.put("role", "[0]");
                param.put("status", 1);
                param.put("createTime", new Date());
                param.put("root", true);
                userDao.insert(param);
                int id = userDao.searchIdByOpenId(openId);

                MessageEntity entity=new MessageEntity();
                entity.setSenderId(0);
                entity.setSenderName("系统消息");
                entity.setUuid(IdUtil.simpleUUID());
                entity.setMsg("欢迎您注册成为超级管理员，请及时更新你的员工个人信息。");
                entity.setSendTime(new Date());
                messageTask.sendAsync(id+"",entity);

                return id;
            }
            else{
                throw new EmosException("无法绑定管理员账号");
            }
        }
        else{

        }
        return 0;
    }

    @Override
    public Set<String> searchUserPermissions(int userId) {
        Set<String> permissions = userDao.searchUserPermissions(userId);
        return permissions;
    }

    @Override
    public Integer login(String code) {
        String openId=getOpenId(code);
        Integer id=userDao.searchIdByOpenId(openId);
        if(id==null){
            throw new EmosException("帐户不存在");
        }
        //TODO mq消息
        messageTask.receiveAsync(id+"");

        return id;
    }

    @Override
    public ArrayList<HashMap> searchUserGroupByDept(String keyword) {

        ArrayList<HashMap> list_1 = deptDao.searchDeptMembers(keyword);
        ArrayList<HashMap> list_2 = userDao.searchUserGroupByDept(keyword);

        for (HashMap map_1 : list_1){
            long deptId = (long) map_1.get("id");
            ArrayList members = new ArrayList();
            for (HashMap map_2 : list_2){
                long id = (long) map_2.get("deptId");
                if (deptId == id){
                    members.add(map_2);
                }
            }
            map_1.put("members", members);
        }
        return list_1;
    }

    @Override
    public ArrayList<HashMap> searchMembers(List param) {
        ArrayList<HashMap> list = userDao.searchMembers(param);
        return list;
    }

    @Override
    public TbUser searchById(int userId) {
        TbUser tbUser = userDao.searchById(userId);
        return tbUser;
    }

    @Override
    public String searchUserHiredate(int userId) {
        String hiredate=userDao.searchUserHiredate(userId);
        return hiredate;
    }

    @Override
    public HashMap searchUserSummary(int userId) {
        HashMap map=userDao.searchUserSummary(userId);
        return map;
    }
}


