package cloud.jkfl.video.controller;

import cloud.jkfl.common.utils.R;
import cloud.jkfl.video.pojo.EduVideo;
import cloud.jkfl.video.service.impl.VideoInfoServiceImpl;
import cloud.jkfl.video.service.impl.VideoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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

}
