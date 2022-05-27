package cloud.jkfl.video.controller;

import cloud.jkfl.common.utils.R;
import cloud.jkfl.video.controller.form.ColItemForm;
import cloud.jkfl.video.pojo.EduVideo;
import cloud.jkfl.video.service.impl.VideoInfoServiceImpl;
import cloud.jkfl.video.service.impl.VideoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/video")
public class VideoDetailController {

    @Autowired
    private VideoServiceImpl videoService;

    @Autowired
    private VideoInfoServiceImpl videoInfoService;


    @PostMapping("/findVideoById")
    public R findVideoById(@RequestParam("id") String id){

        EduVideo byId = videoService.getById(id);
        return R.ok().data("data",byId);
    }

    @PostMapping("/recommoandList")
    public R recommoandList(@RequestParam("label") String label){
        List<EduVideo> eduVideos = videoService.recommoandList(label);
        return R.ok().data("data", eduVideos);
    }


    @PostMapping("/findCollection")
    public R findCollection(@RequestParam("collection") String collection){

        List<ColItemForm> collection1 = videoService.findCollection(collection);

        return R.ok().data("data",collection1);
    }

}
