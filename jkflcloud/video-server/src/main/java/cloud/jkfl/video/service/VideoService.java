package cloud.jkfl.video.service;

import cloud.jkfl.video.controller.form.ColItemForm;
import cloud.jkfl.video.pojo.EduVideo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

public interface VideoService extends IService<EduVideo> {

    public abstract List<EduVideo> selectIndexData1();

    public abstract List<EduVideo> selectIndexData2();

    public abstract List<EduVideo> selectIndexData3();

    public abstract List<EduVideo> recommoandList(String label);

    public List<ColItemForm> findCollection(String collection);
}
