package cloud.jkfl.video.service.impl;

import cloud.jkfl.video.controller.form.ColItemForm;
import cloud.jkfl.video.mapper.VideoMapper;
import cloud.jkfl.video.pojo.EduVideo;
import cloud.jkfl.video.service.VideoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

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

    @Override
    public List<EduVideo> recommoandList(String label) {
        return videoMapper.recommoandList(label);
    }

    @Override
    public List<ColItemForm> findCollection(String collection) {

        List<EduVideo> col = videoMapper.findCollection(collection);
        List<ColItemForm> list = new ArrayList<>();
        System.err.println(col);

        for (EduVideo item : col){
            String s = item.getVdoName().split("\\s+")[0].split("-")[1];
            System.err.println(s);
            ColItemForm colItemForm = new ColItemForm();
            colItemForm.setId(Integer.parseInt(s));
            colItemForm.setTitle(item.getVdoName());

            list.add(colItemForm);
        }
        list.sort(Comparator.comparing(ColItemForm::getId));

        return list;
    }
}
