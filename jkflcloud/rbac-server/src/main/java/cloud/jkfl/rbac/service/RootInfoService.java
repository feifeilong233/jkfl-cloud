package cloud.jkfl.rbac.service;

import cloud.jkfl.common.utils.R;
import cloud.jkfl.rbac.pojo.Root;
import com.baomidou.mybatisplus.extension.service.IService;

public interface RootInfoService extends IService<Root> {
    R findRootByToken(String token);
}
