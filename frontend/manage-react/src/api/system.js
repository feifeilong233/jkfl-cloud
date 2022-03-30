import {jwtServerInstance} from "./index";

//JWT登录认证接口
export const authentication = (username, password)=>{
    return jwtServerInstance.request({
        url:'/back/authentication',
        method:'post',
        data:{
            tel:username,
            pwd:password
        }
    })
}

//JWT令牌刷新接口
export const refreshToken = () => {
    return jwtServerInstance.request({
        url:'/refreshtoken',
        method:'get'
    })
}
