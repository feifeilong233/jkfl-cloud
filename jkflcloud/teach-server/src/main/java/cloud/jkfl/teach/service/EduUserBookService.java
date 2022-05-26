package cloud.jkfl.teach.service;

import cloud.jkfl.teach.pojo.EduChapter;
import cloud.jkfl.teach.pojo.EduUserBook;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface EduUserBookService extends IService<EduUserBook> {
    List<String> getNovelsWithUserId(String userId);

    EduUserBook getChapterIdWithUN(String userId, String novelId);
}
