package cloud.jkfl.examservice.service.impl;

import cloud.jkfl.examservice.mapper.AnswerMapper;
import cloud.jkfl.examservice.pojo.vo.AnswerQuery;
import cloud.jkfl.examservice.service.AnswerService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AnswerServiceImpl implements AnswerService {

    @Autowired
    private AnswerMapper answerMapper;

    @Override
    public IPage<AnswerQuery> findAll(Page<AnswerQuery> page) {
        return answerMapper.findAll(page);
    }
}
