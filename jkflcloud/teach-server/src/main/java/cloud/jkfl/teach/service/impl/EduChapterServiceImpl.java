package cloud.jkfl.teach.service.impl;

import cloud.jkfl.teach.mapper.EduChapterMapper;
import cloud.jkfl.teach.pojo.EduChapter;
import cloud.jkfl.teach.pojo.vo.ChapterVo;
import cloud.jkfl.teach.pojo.vo.EduChapterBlobVo;
import cloud.jkfl.teach.service.EduChapterService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EduChapterServiceImpl
        extends ServiceImpl<EduChapterMapper, EduChapter>
        implements EduChapterService {

    @Autowired
    private EduChapterMapper chapterMapper;

    @Override
    public EduChapterBlobVo getChapterById(String id) {
        return chapterMapper.getChapterById(id);
    }

    @Override
    public List<ChapterVo> getChapterWithNovelId(String id) {
        return chapterMapper.getChapterWithNovelId(id);
    }

    @Override
    public List<ChapterVo> getAllOrder() {
        return chapterMapper.getAllChapter();
    }
}
