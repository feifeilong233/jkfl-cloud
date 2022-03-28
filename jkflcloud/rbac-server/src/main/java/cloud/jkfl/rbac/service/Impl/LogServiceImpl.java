package cloud.jkfl.rbac.service.Impl;

import cloud.jkfl.rbac.mapper.LogMapper;
import cloud.jkfl.rbac.pojo.Log;
import cloud.jkfl.rbac.service.LogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogServiceImpl extends ServiceImpl<LogMapper, Log> implements LogService {

    @Autowired
    private LogMapper logMapper;

    @Override
    public List<Log> getAllLog() {
        return logMapper.getAllLog();
    }
}
