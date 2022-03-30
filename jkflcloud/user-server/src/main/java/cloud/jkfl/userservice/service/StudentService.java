package cloud.jkfl.userservice.service;

import cloud.jkfl.common.utils.R;
import cloud.jkfl.userservice.pojo.Student;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface StudentService extends IService<Student> {
    R getLogin(Long tel, String pwd);

    List<Student> getListWithClassId(Long classId);

    List<Student> getListWithName(String value);

    List<Student> getListWithPid(long parseLong);

    Student getStuByName(String text);
}
