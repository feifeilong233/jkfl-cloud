package cloud.jkfl.video;


import cloud.jkfl.video.controller.form.IndexForm;
import cloud.jkfl.video.pojo.EduVideo;
import cloud.jkfl.video.pojo.EduVideoInfo;
import cloud.jkfl.video.service.impl.VideoInfoServiceImpl;
import cloud.jkfl.video.service.impl.VideoServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@SpringBootTest
public class VideoTestApplication {


    @Autowired
    private VideoServiceImpl videoService;

    @Autowired
    private VideoInfoServiceImpl videoInfoService;

    @Test
    public void Test_insertValue(){

        List<String> list = Stream.of(
                "2-1 本章介绍",
                "2-2 新建SpringBoot项目",
                "2-3 项目初始配置",
                "2-4 代码关联Git远程仓库",
                "2-5 启动日志优化",
                "2-6 开发Hello World接口",
                "2-7 使用HTTP Client测试接口",
                "2-8 SpringBoot配置文件",
                "2-9 集成热部署",
                "2-10 思考：高频面试题(持续更新)",
                "2-11 总结：本章知识点梳理（持续更新）-1",
                "2-11 总结：本章知识点梳理（持续更新）-2"
        ).collect(Collectors.toList());

        for (String _item : list){
            EduVideo eduVideo = new EduVideo();
            EduVideoInfo eduVideoInfo = new EduVideoInfo();

            String uuid = UUID.randomUUID().toString().replaceAll("-", "");

            eduVideo.setVdoId(uuid);
            eduVideo.setVdoName(_item);
            eduVideo.setVdoAuthorId("oD4p-5InZyBZ5wX1Dba5Ol56PGZc");
            eduVideo.setVdoPhoto("https://s1.ax1x.com/2022/05/25/Xk4wwT.png");
            eduVideo.setVdoPath("F:/Projection/jkfl-cloud/data/video/"+_item+".mp4");

            eduVideoInfo.setVdoId(uuid);
            eduVideoInfo.setVdoInfoWatch(0);
            eduVideoInfo.setVdoInfoCollect(0);
            eduVideoInfo.setVdoInfoGood(0);


            boolean save = videoService.save(eduVideo);
            if (!save){
                System.err.println("video插入失败！！！");
                return;
            }
            boolean save1 = videoInfoService.save(eduVideoInfo);
            if (!save1){
                System.err.println("video info插入失败!!!");
                return;
            }

            System.err.println("插入完成");

        }


    }


    @Test
    public void select_response_indexData(){

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
                    return;
                }
            }
        }

    }


}
