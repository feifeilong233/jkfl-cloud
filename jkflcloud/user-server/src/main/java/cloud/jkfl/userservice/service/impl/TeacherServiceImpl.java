package cloud.jkfl.userservice.service.impl;

import cloud.jkfl.common.utils.JWTUtils;
import cloud.jkfl.common.utils.R;
import cloud.jkfl.userservice.mapper.TeacherMapper;
import cloud.jkfl.userservice.pojo.Teacher;
import cloud.jkfl.userservice.service.TeacherService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class TeacherServiceImpl
        extends ServiceImpl<TeacherMapper, Teacher>
        implements TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    @Autowired
    private LoginServiceImpl loginService;

    @Override
    public R getLogin(Long tel, String pwd) {
        Teacher teaByTel = teacherMapper.getTeaByTel(tel);

        if (teaByTel==null){
            return R.error().message("用户不存在");
        }else{
            if(teaByTel.getTeaPwd().equals(pwd)){

                String token = JWTUtils.createToken(teaByTel.getTeaId());
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
    public String teacherNameWithToken(String token) {

        Long Token = loginService.checkToken(token);

        Teacher teacher = teacherMapper.selectById(Token);

        if (teacher == null)
            return "None";

        return teacher.getTeaName();
    }

    @Override
    public Long teacherIdWithToken(String token) {
        return loginService.checkToken(token);
    }

}
