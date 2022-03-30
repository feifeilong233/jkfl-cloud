import axios from 'axios';
import {getJwtToken} from "./utils";

class HttpRequest{
    constructor(baseUrl) {
        this.baseUrl = baseUrl;
    }

    //针对axios实例的默认配置
    initConfig(){
        const config = {
            baseUrl: this.baseUrl,
            headers:{
                //
            }
        };
        return config;
    }

    request(options){
        const instance = axios.create();

        // request拦截器
        instance.interceptors.request.use(
            config => {
                //认证请求不需要携带令牌
                if(config.url !== "/back/authentication") {
                    // 让每个请求携带token
                    config.headers['JWTHeaderName'] = getJwtToken();
                }
                return config;
            })

        //请求响应拦截器
        instance.interceptors.response.use(
            response=>{
                //统一状态处理
                const res = response.data
                if (!res.isok){
                    return Promise.reject(res);
                }else{
                    return res;
                }
            },
            error => {
                if (error&&error.response){
                    switch (error.response.status){
                        case 400:
                            error.message = '错误请求';
                            break;
                        case 401:
                            error.message = '未授权，请重新登录';
                            break;
                        case 403:
                            error.message = '拒绝访问';
                            break;
                        case 404:
                            error.message = '请求错误，未找到该资源';
                            break;
                        case 405:
                            error.message = '请求方法未允许';
                            break;
                        case 408:
                            error.message = '请求超时';
                            break;
                        case 500:
                            error.message = '服务器端出错';
                            break;
                        case 501:
                            error.message = '网络未实现';
                            break;
                        case 502:
                            error.message = '网络错误';
                            break;
                        case 503:
                            error.message = '服务不可用';
                            break;
                        case 504:
                            error.message = '网络超时';
                            break;
                        case 505:
                            error.message = 'http版本不支持请求';
                            break;
                        default:
                            error.message = '未知错误${error.response.status}';
                            break;
                    }
                }else {
                    error.message = '连接到服务器失败';
                }
                return Promise.reject(error);
            }
        )

        options = Object.assign(this.initConfig(),options);
        return instance(options);
    }

}

export default HttpRequest;