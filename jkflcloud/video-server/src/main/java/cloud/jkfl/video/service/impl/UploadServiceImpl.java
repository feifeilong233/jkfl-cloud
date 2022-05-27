package cloud.jkfl.video.service.impl;

import cloud.jkfl.common.utils.R;
import cloud.jkfl.video.pojo.EduVideo;
import cloud.jkfl.video.pojo.EduVideoInfo;
import cloud.jkfl.video.service.UploadService;
import cloud.jkfl.video.utils.FrameGrabberKit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
@Transactional
public class UploadServiceImpl implements UploadService {

    @Autowired
    private VideoServiceImpl videoService;

    @Autowired
    private VideoInfoServiceImpl videoInfoService;

    /**
     * 视频文件上传
     */
    @Override
    public R uploadVideo(MultipartFile file, HttpServletRequest request, String title) throws Exception {
        Map<String, Object> resultMap=new HashMap<String, Object>();

        System.err.println(title);

        String basePath = request.getScheme() + "://" + request.getServerName()
                + ":" + request.getServerPort()+"/jkfl-cloud/data/upload/video/";

        Long time = new Date().getTime();

        String fileName = file.getOriginalFilename();//文件原始名称
        String suffixName = fileName.substring(fileName.lastIndexOf("."));//从最后一个.开始截取。截取fileName的后缀名
        String newFileName = time+suffixName; //文件新名称
        //设置文件存储路径，可以存放在你想要指定的路径里面
        String rootPath="F:/Projection/jkfl-cloud/data/"+ File.separator+"upload/video/"; //上传视频存放位置

        String filePath = rootPath+newFileName;
        File newFile = new File(filePath);
        //判断目标文件所在目录是否存在
        if(!newFile.getParentFile().exists()){
            //如果目标文件所在的目录不存在，则创建父目录
            newFile.getParentFile().mkdirs();
        }

        //将内存中的数据写入磁盘
        file.transferTo(newFile);
        //视频上传保存url
        String videoUrl = basePath + newFileName;

        //视频封面图处理
        String newImgName = time+".jpg";
        String framefile = rootPath + newImgName;
        String imgUrlSave = basePath+newImgName;//图片最终位置路径
        //视频截取封面图
        String imgUrl= FrameGrabberKit.getVedioImg(videoUrl, framefile, imgUrlSave);

        resultMap.put("videoUrl", videoUrl);
        /*存储图片有bug*/
        resultMap.put("imgUrl", "https://s1.ax1x.com/2022/05/25/Xk4wwT.png");

        EduVideo eduVideo = new EduVideo();
        EduVideoInfo eduVideoInfo = new EduVideoInfo();

        String uuid = UUID.randomUUID().toString().replaceAll("-", "");

        eduVideo.setVdoId(uuid);
        eduVideo.setVdoName(title);
        eduVideo.setVdoAuthorId("oD4p-5InZyBZ5wX1Dba5Ol56PGZc");
        eduVideo.setVdoPhoto("https://s1.ax1x.com/2022/05/25/Xk4wwT.png");
        eduVideo.setVdoLabel("技术");
        eduVideo.setVdoCollection("前后端分离-实战wiki知识库系统");
        eduVideo.setVdoPath(videoUrl);

        eduVideoInfo.setVdoId(uuid);
        eduVideoInfo.setVdoInfoWatch(0);
        eduVideoInfo.setVdoInfoCollect(0);
        eduVideoInfo.setVdoInfoGood(0);

        boolean save = videoService.save(eduVideo);
        if (!save){
            System.err.println("video插入失败！！！");
            return R.ok().data("data",new HashMap<>());
        }
        boolean save1 = videoInfoService.save(eduVideoInfo);
        if (!save1){
            System.err.println("video info插入失败!!!");
            return R.ok().data("data",new HashMap<>());
        }


        //System.out.println("上传的文件名为："+fileName+",后缀名为："+newFileName);
        return R.ok().data("data",resultMap);
    }

    /**
     * 图片文件上传
     */
    @Override
    public R uploadImage(MultipartFile file, HttpServletRequest request) throws Exception {
        Map<String, Object> resultMap=new HashMap<String, Object>();

        String basePath = request.getScheme() + "://" + request.getServerName()
                + ":" + request.getServerPort()+"/jkfl-cloud/data/upload/images/";

        Long time = new Date().getTime();

        String fileName = file.getOriginalFilename();//文件原始名称
        String suffixName = fileName.substring(fileName.lastIndexOf("."));//从最后一个.开始截取。截取fileName的后缀名
        String newFileName = time+suffixName; //文件新名称
        //设置文件存储路径，可以存放在你想要指定的路径里面
        String rootPath="F:/Projection/jkfl-cloud/data/"+File.separator+"upload/images/"; //上传图片存放位置

        String filePath = rootPath+newFileName;
        File newFile = new File(filePath);
        //判断目标文件所在目录是否存在
        if(!newFile.getParentFile().exists()){
            //如果目标文件所在的目录不存在，则创建父目录
            newFile.getParentFile().mkdirs();
        }

        //将内存中的数据写入磁盘
        file.transferTo(newFile);
        //图片上传保存url
        String imgUrl = basePath + newFileName;

        resultMap.put("imgUrl", imgUrl);
        return R.ok().data("data",resultMap);
    }

}
