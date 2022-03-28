package cloud.jkfl.rbac.service;

import cloud.jkfl.rbac.pojo.Log;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface LogService extends IService<Log> {

    public abstract List<Log> getAllLog();
}
