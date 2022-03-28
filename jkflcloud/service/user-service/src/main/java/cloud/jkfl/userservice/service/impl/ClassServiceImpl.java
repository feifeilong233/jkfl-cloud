package cloud.jkfl.userservice.service.impl;

import cloud.jkfl.userservice.mapper.ClassMapper;
import cloud.jkfl.userservice.pojo.Class;
import cloud.jkfl.userservice.service.ClassService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClassServiceImpl
        extends ServiceImpl<ClassMapper, Class> implements ClassService {

    @Autowired
    private ClassMapper classMapper;

    @Override
    public Long getClassIdByName(String value) {
        return classMapper.getClassIdByName(value);
    }
}
