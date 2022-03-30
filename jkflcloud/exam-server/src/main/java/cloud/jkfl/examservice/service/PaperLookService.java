package cloud.jkfl.examservice.service;


import cloud.jkfl.examservice.pojo.PaperLook;
import com.baomidou.mybatisplus.extension.service.IService;

public interface PaperLookService extends IService<PaperLook> {
    Long getIdWithName(String paperName);

    PaperLook getWithName(String paperName);
}
