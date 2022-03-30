package cloud.jkfl.userservice.service;

public interface LoginService {

    Long checkToken(String token);

    boolean userWithToken(String Token, Integer type);

}
