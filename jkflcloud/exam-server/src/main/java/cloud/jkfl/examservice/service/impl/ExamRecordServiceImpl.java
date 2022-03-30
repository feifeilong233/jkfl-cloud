package cloud.jkfl.examservice.service.impl;

import cloud.jkfl.examservice.mapper.ExamRecordMapper;
import cloud.jkfl.examservice.pojo.ExamRecord;
import cloud.jkfl.examservice.service.ExamRecordService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExamRecordServiceImpl extends ServiceImpl<ExamRecordMapper, ExamRecord>  implements ExamRecordService {

    @Autowired
    private ExamRecordMapper examRecordMapper;

    @Override
    public List<ExamRecord> getRecordsWithExamId(Long id) {
        return examRecordMapper.getRecordsWithExamId(id);
    }

    @Override
    public ExamRecord getRecordWithJoinerId(String joiner_id) {
        return examRecordMapper.getRecordWithJoinerId(joiner_id);
    }
}
