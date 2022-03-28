package cloud.jkfl.rbac.service;

import cloud.jkfl.rbac.pojo.Student;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;


public interface StudentService extends IService<Student> {

    List<Student> getSelectStu(Map<String,List<String>> map);

}
