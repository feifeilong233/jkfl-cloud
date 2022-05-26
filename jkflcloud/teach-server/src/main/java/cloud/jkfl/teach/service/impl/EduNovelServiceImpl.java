package cloud.jkfl.teach.service.impl;

import cloud.jkfl.teach.mapper.EduNovelMapper;
import cloud.jkfl.teach.pojo.EduNovel;
import cloud.jkfl.teach.service.EduNovelService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EduNovelServiceImpl
        extends ServiceImpl<EduNovelMapper, EduNovel>
        implements EduNovelService {

    @Autowired
    private EduNovelMapper eduNovelMapper;

    @Override
    public List<EduNovel> getListWithUFI(String userId, String format, String input) {
        return eduNovelMapper.getListWithUFI(userId, format, input);
    }
}
