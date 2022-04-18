package cloud.jkfl.teach.service;

import cloud.jkfl.teach.pojo.EduNovel;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface EduNovelService extends IService<EduNovel> {
    List<EduNovel> getListWithUFI(String userId, String format, String input);
}
