package cloud.jkfl.rbac.service.Impl;

import cloud.jkfl.rbac.mapper.StudentMapper;
import cloud.jkfl.rbac.mapper.UserMapper;
import cloud.jkfl.rbac.pojo.User;
import cloud.jkfl.rbac.service.StudentService;
import cloud.jkfl.rbac.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.netflix.discovery.converters.Auto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {


    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> getSelectStu(Map<String, List<String>> map) {
        return userMapper.getSelectStu(map);
    }
}
