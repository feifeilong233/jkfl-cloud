package cloud.jkfl.examservice.service;


import cloud.jkfl.examservice.pojo.Score;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface ScoreService extends IService<Score> {
    public abstract List<Score> findByExamId(Long examId);
}
