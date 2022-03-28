package cloud.jkfl.examservice.service.impl;

import cloud.jkfl.examservice.mapper.PaperManageMapper;
import cloud.jkfl.examservice.pojo.PaperManage;
import cloud.jkfl.examservice.service.PaperManageService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class PaperManageServiceImpl extends ServiceImpl<PaperManageMapper, PaperManage> implements PaperManageService {
}
