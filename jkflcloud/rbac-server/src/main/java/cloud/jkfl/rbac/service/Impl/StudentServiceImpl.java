package cloud.jkfl.rbac.service.Impl;

import cloud.jkfl.rbac.mapper.StudentMapper;
import cloud.jkfl.rbac.pojo.Student;
import cloud.jkfl.rbac.service.StudentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Override
    public List<Student> getSelectStu(Map<String, List<String>> map) {
        return studentMapper.getSelectStu(map);
    }
}
