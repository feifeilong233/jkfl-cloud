package cloud.jkfl.examservice.service.impl;

import cloud.jkfl.examservice.mapper.CheckinMapper;
import cloud.jkfl.examservice.pojo.Checkin;
import cloud.jkfl.examservice.service.CheckinService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class CheckinServiceImpl extends ServiceImpl<CheckinMapper, Checkin> implements CheckinService {
}
