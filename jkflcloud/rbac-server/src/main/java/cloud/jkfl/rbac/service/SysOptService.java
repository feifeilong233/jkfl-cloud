package cloud.jkfl.rbac.service;

import cloud.jkfl.rbac.pojo.vo.SysOptVO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface SysOptService {

    public List<SysOptVO> getSysOptList();

}
