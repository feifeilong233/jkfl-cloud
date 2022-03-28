/***********************************************************
 * @Description : 用户接口
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.service;

import cloud.jkfl.client.dto.RegisterDTO;
import cloud.jkfl.client.entity.User;
import cloud.jkfl.client.qo.LoginQo;
import cloud.jkfl.client.vo.UserInfoVo;
import cloud.jkfl.client.vo.UserVo;

public interface UserService {
    /**
     * 注册
     *
     * @param registerDTO 注册参数
     * @return 注册成功后的用户信息
     */
    User register(RegisterDTO registerDTO);

    /**
     * 登录接口，登录成功返回token
     *
     * @param loginQo 登录参数
     * @return 成功返回token，失败返回null
     */
    String login(LoginQo loginQo);

    /**
     * 根据用户id获取用户信息
     *
     * @return 用户实体
     */
    UserVo getUserInfo(String userId);

    /**
     * 获取用户详细信息(主要是权限相关的)
     * @param userId 用户的id
     * @return 用户信息组装的实体
     */
    UserInfoVo getInfo(String userId);
}
