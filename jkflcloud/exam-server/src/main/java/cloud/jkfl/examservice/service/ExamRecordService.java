package cloud.jkfl.examservice.service;

import cloud.jkfl.examservice.pojo.ExamRecord;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface ExamRecordService extends IService<ExamRecord> {

    List<ExamRecord> getRecordsWithExamId(Long id);

    ExamRecord getRecordWithJoinerId(String joiner_id);
}
