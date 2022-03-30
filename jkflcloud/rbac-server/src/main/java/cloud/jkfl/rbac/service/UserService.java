package cloud.jkfl.rbac.service;

import cloud.jkfl.rbac.pojo.User;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;


public interface UserService extends IService<User> {

    List<User> getSelectStu(Map<String,List<String>> map);

}
