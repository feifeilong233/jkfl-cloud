package cloud.jkfl.examservice.service.impl;

import cloud.jkfl.examservice.mapper.PaperLookMapper;
import cloud.jkfl.examservice.pojo.PaperLook;
import cloud.jkfl.examservice.service.PaperLookService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaperLookServiceImpl
        extends ServiceImpl<PaperLookMapper, PaperLook>
        implements PaperLookService {

    @Autowired
    private PaperLookMapper paperLookMapper;

    @Override
    public Long getIdWithName(String paperName) {
        return paperLookMapper.getIdWithName(paperName);
    }

    @Override
    public PaperLook getWithName(String paperName) {
        return paperLookMapper.getWithName(paperName);
    }
}
