package cloud.jkfl.rbac.service;


import cloud.jkfl.rbac.pojo.Teacher;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

public interface TeacherService extends IService<Teacher> {
    List<Teacher> getSelectTea(Map<String, List<String>> map);
}
