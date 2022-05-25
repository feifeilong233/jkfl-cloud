package xion.boot.online.config.shiro;

import org.springframework.stereotype.Component;

/**
 * Token媒介类
 * */
@Component
public class ThreadLocalToken {

    private ThreadLocal<String> local = new ThreadLocal<>();

    public void setToken(String token){
        local.set(token);
    }

    public String getToken(){
        return (String) local.get();
    }

    public void clear(){
        local.remove();
    }
}