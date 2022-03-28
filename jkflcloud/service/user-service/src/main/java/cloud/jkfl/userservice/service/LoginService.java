package cloud.jkfl.userservice.service;

import cloud.jkfl.commonutils.R;

public interface LoginService {

    Long checkToken(String token);

    boolean userWithToken(String Token, Integer type);

}
