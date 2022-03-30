package cloud.jkfl.userservice.service.impl;

import cloud.jkfl.common.utils.JWTUtils;

import cloud.jkfl.userservice.mapper.StudentMapper;
import cloud.jkfl.userservice.mapper.TeacherMapper;
import cloud.jkfl.userservice.mapper.UserMapper;

import cloud.jkfl.userservice.pojo.Teacher;
import cloud.jkfl.userservice.pojo.User;
import cloud.jkfl.userservice.service.LoginService;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private UserMapper studentMapper;

    @Autowired
    private TeacherMapper teacherMapper;

    @Override
    public Long checkToken(String token) {
        if (token==null)
            return null;
        Map<String,Object> stringObjectMap = JWTUtils.checkToken(token);
        if (stringObjectMap==null)
            return null;
        //如果有的话，查redis
        System.out.println(stringObjectMap);
        JSONObject json = new JSONObject(stringObjectMap);
        Long userId = json.getLong("userId");

        return userId;
    }

    @Override
    public boolean userWithToken(String Token, Integer type) {

        Long token = checkToken(Token);

        if (type==1){
            /*stu*/
            User student = studentMapper.selectById(token);
            if (student==null)
                return false;
        }else{
            /*tea*/
            Teacher teacher = teacherMapper.selectById(token);
            if (teacher==null)
                return false;
        }

        return true;
    }

}
