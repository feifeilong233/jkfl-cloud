package cloud.jkfl.examservice.service.impl;

import cloud.jkfl.examservice.mapper.ExamManageMapper;
import cloud.jkfl.examservice.pojo.ExamManage;
import cloud.jkfl.examservice.service.ExamManageService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExamManageServiceImpl extends ServiceImpl<ExamManageMapper, ExamManage>  implements ExamManageService {

    @Autowired
    private ExamManageMapper examManageMapper;

    @Override
    public ExamManage findOnlyPaperId() {
        return examManageMapper.findOnlyPaperId();
    }

    @Override
    public ExamManage getExamWithClassId(Long classId) {
        return examManageMapper.getExamWithClassId(classId);
    }
}
