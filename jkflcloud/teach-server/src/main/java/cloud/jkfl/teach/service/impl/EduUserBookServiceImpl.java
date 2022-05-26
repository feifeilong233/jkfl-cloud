package cloud.jkfl.teach.service.impl;

import cloud.jkfl.teach.mapper.EduUserBookMapper;
import cloud.jkfl.teach.pojo.EduChapter;
import cloud.jkfl.teach.pojo.EduUserBook;
import cloud.jkfl.teach.service.EduUserBookService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EduUserBookServiceImpl
        extends ServiceImpl<EduUserBookMapper, EduUserBook>
        implements EduUserBookService {

    @Autowired
    private EduUserBookMapper eduUserBookMapper;

    @Override
    public List<String> getNovelsWithUserId(String userId) {
        return eduUserBookMapper.getNovelsWithUserId(userId);
    }

    @Override
    public EduUserBook getChapterIdWithUN(String userId, String novelId) {
        return eduUserBookMapper.getChapterIdWithUN(userId, novelId);
    }
}
