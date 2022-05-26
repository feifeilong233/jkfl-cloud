package cloud.jkfl.video.controller;

import cloud.jkfl.common.utils.R;
import cloud.jkfl.video.controller.form.IndexForm;
import cloud.jkfl.video.pojo.EduVideo;
import cloud.jkfl.video.pojo.EduVideoInfo;
import cloud.jkfl.video.service.impl.VideoInfoServiceImpl;
import cloud.jkfl.video.service.impl.VideoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/info")
public class VideoIndexController {

    @Autowired
    private VideoServiceImpl videoService;

    @Autowired
    private VideoInfoServiceImpl videoInfoService;


    @PostMapping("/getInfoList1")
    public R getInfoList1(){
        List<EduVideo> eduVideos = videoService.selectIndexData1();
        List<IndexForm> data = new ArrayList<>();

        for (EduVideo vi : eduVideos){

            List<EduVideoInfo> videoInfo = videoInfoService.getVideoInfoWithId(vi.getVdoId());
            for (EduVideoInfo info : videoInfo){

                IndexForm indexForm = new IndexForm();
                indexForm.setId(vi.getVdoId());
                indexForm.setTitle(vi.getVdoName());
                indexForm.setPhoto(vi.getVdoPhoto());
                indexForm.setPath(vi.getVdoPath());
                indexForm.setTime(vi.getCreateTime());
                indexForm.setGood(info.getVdoInfoGood().toString());
                indexForm.setWatch(info.getVdoInfoWatch().toString());
                indexForm.setLabel("技术");

                boolean add = data.add(indexForm);
                if (!add){
                    System.err.println("Video Info 数据整合失败");
                    return R.ok().data("data1",new ArrayList<>());
                }
            }
        }

        return R.ok().data("data1", data);
    }

    @PostMapping("/getInfoList2")
    public R getInfoList2(){
        List<EduVideo> eduVideos = videoService.selectIndexData2();
        List<IndexForm> data = new ArrayList<>();

        for (EduVideo vi : eduVideos){

            List<EduVideoInfo> videoInfo = videoInfoService.getVideoInfoWithId(vi.getVdoId());
            for (EduVideoInfo info : videoInfo){

                IndexForm indexForm = new IndexForm();
                indexForm.setId(vi.getVdoId());
                indexForm.setTitle(vi.getVdoName());
                indexForm.setPhoto(vi.getVdoPhoto());
                indexForm.setPath(vi.getVdoPath());
                indexForm.setTime(vi.getCreateTime());
                indexForm.setGood(info.getVdoInfoGood().toString());
                indexForm.setWatch(info.getVdoInfoWatch().toString());
                indexForm.setLabel("技术");

                boolean add = data.add(indexForm);
                if (!add){
                    System.err.println("Video Info 数据整合失败");
                    return R.ok().data("data2",new ArrayList<>());
                }
            }
        }

        return R.ok().data("data2", data);
    }


    @PostMapping("/getInfoList3")
    public R getInfoList3(){
        List<EduVideo> eduVideos = videoService.selectIndexData3();
        List<IndexForm> data = new ArrayList<>();

        for (EduVideo vi : eduVideos){

            List<EduVideoInfo> videoInfo = videoInfoService.getVideoInfoWithId(vi.getVdoId());
            for (EduVideoInfo info : videoInfo){

                IndexForm indexForm = new IndexForm();
                indexForm.setId(vi.getVdoId());
                indexForm.setTitle(vi.getVdoName());
                indexForm.setPhoto(vi.getVdoPhoto());
                indexForm.setPath(vi.getVdoPath());
                indexForm.setTime(vi.getCreateTime());
                indexForm.setGood(info.getVdoInfoGood().toString());
                indexForm.setWatch(info.getVdoInfoWatch().toString());
                indexForm.setLabel("技术");

                boolean add = data.add(indexForm);
                if (!add){
                    System.err.println("Video Info 数据整合失败");
                    return R.ok().data("data3",new ArrayList<>());
                }
            }
        }

        return R.ok().data("data3", data);
    }

}
