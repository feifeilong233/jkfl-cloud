package cloud.jkfl.video.service.impl;

import cloud.jkfl.video.mapper.VideoMapper;
import cloud.jkfl.video.pojo.EduVideo;
import cloud.jkfl.video.service.VideoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VideoServiceImpl extends ServiceImpl<VideoMapper, EduVideo>
        implements VideoService {

    @Autowired
    private VideoMapper videoMapper;


    @Override
    public List<EduVideo> selectIndexData1() {
        return videoMapper.selectIndexData1();
    }

    @Override
    public List<EduVideo> selectIndexData2() {
        return videoMapper.selectIndexData2();
    }

    @Override
    public List<EduVideo> selectIndexData3() {
        return videoMapper.selectIndexData3();
    }
}
