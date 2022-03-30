package cloud.jkfl.userservice.service;

import cloud.jkfl.common.utils.R;
import cloud.jkfl.userservice.pojo.Teacher;
import com.baomidou.mybatisplus.extension.service.IService;

public interface TeacherService extends IService<Teacher> {

    R getLogin(Long tel, String pwd);

    String teacherNameWithToken(String token);

    Long teacherIdWithToken(String token);
}
