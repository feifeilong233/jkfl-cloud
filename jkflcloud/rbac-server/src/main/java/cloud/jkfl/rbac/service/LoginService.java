package cloud.jkfl.rbac.service;

import cloud.jkfl.commonutils.R;
import cloud.jkfl.rbac.pojo.Root;

public interface LoginService{

    public abstract R getLogin(Long tel,String pwd);

    Long checkToken(String token);
}
