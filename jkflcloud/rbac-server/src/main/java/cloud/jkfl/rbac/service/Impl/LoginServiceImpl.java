package cloud.jkfl.rbac.service.Impl;

import cloud.jkfl.common.utils.JWTUtils;
import cloud.jkfl.common.utils.R;
import cloud.jkfl.rbac.mapper.RootMapper;
import cloud.jkfl.rbac.pojo.Root;
import cloud.jkfl.rbac.service.LoginService;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private RootMapper rootMapper;

    @Override
    public R getLogin(Long tel,String pwd) {

        Root root = rootMapper.getAdminByTel(tel);
        //System.out.println(root);

        if (root==null){
            return R.error().message("用户不存在");
        }else{
            if(root.getAdminPwd().equals(pwd)){

                String token = JWTUtils.createToken(root.getAdminId());
                /**
                 * 存入redis，如果之后写了的话
                 */

                return R.ok().message(token);

            }else{
                return R.error().message("密码错误");
            }
        }
    }

    @Override
    public Long checkToken(String token) {
        if (token==null)
            return null;
        Map<String,Object> stringObjectMap = JWTUtils.checkToken(token);
        if (stringObjectMap==null)
            return null;
        //如果有的话，查redis
        System.out.println(stringObjectMap);
        JSONObject json = new JSONObject(stringObjectMap);
        Long userId = json.getLong("userId");

        return userId;
    }
}
