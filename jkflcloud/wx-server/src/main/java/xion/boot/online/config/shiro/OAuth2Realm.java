package xion.boot.online.config.shiro;

import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import xion.boot.online.exception.EmosException;
import xion.boot.online.pojo.TbUser;
import xion.boot.online.service.Impl.UserServiceImpl;
import xion.boot.online.service.UserService;

import java.util.Set;

@Component
public class OAuth2Realm extends AuthorizingRealm {

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private UserServiceImpl userService;

    @Override
    public boolean supports(AuthenticationToken token){
        return token instanceof OAuth2Token;
    }

    /**
     * 授权（验证权限时调用）
     * */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection collection) {

        TbUser user= (TbUser) collection.getPrimaryPrincipal();
        int userId=user.getId();
        Set<String> permsSet=userService.searchUserPermissions(userId);
        //TODO 查询用户的权限列表
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        //TODO 把权限列表添加到info对象中
        info.setStringPermissions(permsSet);
        return info;
    }

    /**
     * 认证（登陆时调用）
     * */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String accessToken = (String) token.getPrincipal();
        int userId = jwtUtil.getUserId(accessToken);
        TbUser user = userService.searchById(userId);

        //TODO 从令牌中获得userId， 然后检测用户是否被冻结
        if (user == null){
            throw new LockedAccountException("账号已经被锁定，请联系管理员");
        }
        //TODO 向info对象中添加用户信息、Token字符串
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, accessToken, getName());
        return info;
    }
}
