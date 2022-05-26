package cloud.jkfl.video.service.impl;

import cloud.jkfl.video.mapper.VideoInfoMapper;
import cloud.jkfl.video.pojo.EduVideoInfo;
import cloud.jkfl.video.service.VideoInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VideoInfoServiceImpl extends ServiceImpl<VideoInfoMapper, EduVideoInfo>
        implements VideoInfoService {


    @Autowired
    private VideoInfoMapper videoInfoMapper;


    @Override
    public List<EduVideoInfo> getVideoInfoWithId(String id) {
        return videoInfoMapper.getVideoInfoWithId(id);
    }
}
