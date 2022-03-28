package cloud.jkfl.rbac.service.Impl;

import cloud.jkfl.rbac.mapper.TeacherMapper;
import cloud.jkfl.rbac.pojo.Teacher;
import cloud.jkfl.rbac.service.TeacherService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TeacherServiceImpl extends ServiceImpl<TeacherMapper, Teacher> implements TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    @Override
    public List<Teacher> getSelectTea(Map<String, List<String>> map) {
        return teacherMapper.getSelectList(map);
    }
}
