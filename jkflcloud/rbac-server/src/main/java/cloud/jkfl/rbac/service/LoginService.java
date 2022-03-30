package cloud.jkfl.rbac.service;


import cloud.jkfl.common.utils.R;

public interface LoginService{

    public abstract R getLogin(Long tel, String pwd);

    Long checkToken(String token);
}
