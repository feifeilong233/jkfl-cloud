package cloud.jkfl.rbac.service.Impl;


import cloud.jkfl.common.utils.R;
import cloud.jkfl.rbac.mapper.RootMapper;
import cloud.jkfl.rbac.pojo.Root;
import cloud.jkfl.rbac.service.RootInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RootInfoServiceImpl extends ServiceImpl<RootMapper, Root> implements RootInfoService {

    @Autowired
    private LoginServiceImpl loginService;

    @Autowired
    private RootMapper rootMapper;

    @Override
    public R findRootByToken(String token) {

        // 1- 校验token是否合法
        if (token==null){
            R.error().message("token不合法！");
        }

        Long userId = loginService.checkToken(token);//查询成功就返回userId，然后去admin表里面查对应信息

        // 2- 如有写了的redis的话，校验redis

        // 3- 成功返回对应的结果
        Root root = rootMapper.selectById(userId);

        return R.ok().data("user",root);
    }
}
