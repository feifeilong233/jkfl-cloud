package cloud.jkfl.examservice.service.impl;

import cloud.jkfl.examservice.mapper.ScoreMapper;
import cloud.jkfl.examservice.pojo.Score;
import cloud.jkfl.examservice.service.ScoreService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScoreServiceImpl extends ServiceImpl<ScoreMapper, Score> implements ScoreService {

    @Autowired
    private ScoreMapper scoreMapper;


    @Override
    public List<Score> findByExamId(Long examId) {
        return scoreMapper.findByExamId(examId);
    }
}
