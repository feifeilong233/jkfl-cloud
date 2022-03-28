package cloud.jkfl.userservice.service;

import cloud.jkfl.userservice.pojo.Class;
import com.baomidou.mybatisplus.extension.service.IService;

public interface ClassService extends IService<Class> {
    Long getClassIdByName(String value);
}
