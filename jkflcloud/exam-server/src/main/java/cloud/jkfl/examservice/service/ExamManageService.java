package cloud.jkfl.examservice.service;

import cloud.jkfl.examservice.pojo.ExamManage;
import com.baomidou.mybatisplus.extension.service.IService;

public interface ExamManageService extends IService<ExamManage> {
    public abstract ExamManage findOnlyPaperId();

    ExamManage getExamWithClassId(Long classId);
}
