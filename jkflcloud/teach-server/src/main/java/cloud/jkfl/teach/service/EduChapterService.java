package cloud.jkfl.teach.service;

import cloud.jkfl.teach.pojo.EduChapter;
import cloud.jkfl.teach.pojo.vo.ChapterVo;
import cloud.jkfl.teach.pojo.vo.EduChapterBlobVo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface EduChapterService extends IService<EduChapter> {

    EduChapterBlobVo getChapterById(String id);

    List<ChapterVo> getChapterWithNovelId(String id);

    List<ChapterVo> getAllOrder();
}
