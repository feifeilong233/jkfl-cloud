package cloud.jkfl.userservice.service.impl;

import cloud.jkfl.common.utils.JWTUtils;
import cloud.jkfl.common.utils.R;

import cloud.jkfl.userservice.mapper.StudentMapper;
import cloud.jkfl.userservice.pojo.Student;
import cloud.jkfl.userservice.service.StudentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl
        extends ServiceImpl<StudentMapper, Student>
        implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Override
    public R getLogin(Long tel, String pwd) {
        Student stuByTel = studentMapper.getStuByTel(tel);

        if (stuByTel==null){
            return R.error().message("用户不存在");
        }else{
            if(stuByTel.getStuPwd().equals(pwd)){

                String token = JWTUtils.createToken(stuByTel.getStuId());
                /**
                 * 存入redis，如果之后写了的话
                 */

                return R.ok().message(token);

            }else{
                return R.error().message("密码错误");
            }
        }
    }

    @Override
    public List<Student> getListWithClassId(Long classId) {
        return studentMapper.getListWithClassId(classId);
    }

    @Override
    public List<Student> getListWithName(String value) {
        return studentMapper.getListWithName(value);
    }

    @Override
    public List<Student> getListWithPid(long parseLong) {
        return studentMapper.getListWithPid(parseLong);
    }

    @Override
    public Student getStuByName(String text) {
        return studentMapper.getStuByName(text);
    }
}
