package cloud.jkfl.teach.service.impl;

import cloud.jkfl.teach.mapper.EduExtInfoMapper;
import cloud.jkfl.teach.pojo.EduExtInfo;
import cloud.jkfl.teach.service.EduExtInfoService;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class EduExtInfoServiceImpl
        extends ServiceImpl<EduExtInfoMapper, EduExtInfo>
        implements EduExtInfoService {

}
