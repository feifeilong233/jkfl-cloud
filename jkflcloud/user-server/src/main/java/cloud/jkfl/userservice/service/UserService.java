package cloud.jkfl.userservice.service;

import cloud.jkfl.common.utils.R;
import cloud.jkfl.userservice.pojo.User;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;


public interface UserService extends IService<User> {

    R getLogin(Long tel, String pwd);

    List<User> getListWithClassId(Long classId);

    List<User> getListWithName(String value);

    List<User> getListWithPid(long parseLong);

    User getStuByName(String text);

    String getIdWithPid(Long pid);
}
