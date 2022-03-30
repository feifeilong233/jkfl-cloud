package cloud.jkfl.examservice.service;


import cloud.jkfl.examservice.pojo.vo.AnswerQuery;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

public interface AnswerService {

    public abstract IPage<AnswerQuery> findAll(Page<AnswerQuery> page);
}
