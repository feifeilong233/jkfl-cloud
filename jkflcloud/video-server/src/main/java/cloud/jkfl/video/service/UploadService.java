package cloud.jkfl.video.service;

import cloud.jkfl.common.utils.R;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public interface UploadService {

    /**
     * 视频文件上传
     * @param request
     * @return
     */
    public R uploadVideo(MultipartFile file, HttpServletRequest request, String title) throws Exception;

    /**
     * 图片文件上传
     * @param request
     * @return
     */
    public R uploadImage(MultipartFile file,HttpServletRequest request) throws Exception;
}