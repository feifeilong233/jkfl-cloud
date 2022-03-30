package cloud.jkfl.userservice.service.impl;

import cloud.jkfl.common.utils.JWTUtils;
import cloud.jkfl.common.utils.R;
import cloud.jkfl.userservice.mapper.StudentMapper;
import cloud.jkfl.userservice.mapper.UserMapper;
import cloud.jkfl.userservice.pojo.User;
import cloud.jkfl.userservice.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {


    @Autowired
    private UserMapper studentMapper;

    @Override
    public R getLogin(Long tel, String pwd) {
        User stuByTel = studentMapper.getStuByTel(tel);

        if (stuByTel==null){
            return R.error().message("用户不存在");
        }else{
            if(stuByTel.getUserPassword().equals(pwd)){

                //String token = JWTUtils.createToken(stuByTel.getUserId());
                /**
                 * 存入redis，如果之后写了的话
                 */

                return R.ok().message("UserServiceImpl - 37行");

            }else{
                return R.error().message("密码错误");
            }
        }
    }

    @Override
    public List<User> getListWithClassId(Long classId) {
        return studentMapper.getListWithClassId(classId);
    }

    @Override
    public List<User> getListWithName(String value) {
        return studentMapper.getListWithName(value);
    }

    @Override
    public List<User> getListWithPid(long parseLong) {
        return studentMapper.getListWithPid(parseLong);
    }

    @Override
    public User getStuByName(String text) {
        return studentMapper.getStuByName(text);
    }

    @Override
    public String getIdWithPid(Long pid) {
        return studentMapper.getIdWithPid(pid);
    }
}
