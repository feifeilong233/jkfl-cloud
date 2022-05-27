package cloud.jkfl.video.controller;


import cloud.jkfl.common.utils.R;
import cloud.jkfl.video.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RestController
@RequestMapping("/upload")
public class UploadController {

    @Autowired
    private UploadService uploadService;


    @RequestMapping(value ="/uploadVideo",method= RequestMethod.POST)
    public R uploadVideo(MultipartFile file, HttpServletRequest request, @RequestParam("title") String title) throws Exception{
        return uploadService.uploadVideo(file, request, title);
    }

    /**
     * 图片文件上传
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value ="/uploadImage",method=RequestMethod.POST)
    public R uploadImage(MultipartFile file,HttpServletRequest request) throws Exception{
        return uploadService.uploadImage(file, request);
    }

}
