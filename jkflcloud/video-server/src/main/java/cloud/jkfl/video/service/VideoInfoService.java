package cloud.jkfl.video.service;

import cloud.jkfl.video.pojo.EduVideoInfo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface VideoInfoService extends IService<EduVideoInfo> {

    public abstract List<EduVideoInfo> getVideoInfoWithId(String id);

}
