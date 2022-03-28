package cloud.jkfl.servicebase.handler;

import cloud.jkfl.commonutils.R;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(GlobalException.class)
    @ResponseBody
    public R error(GlobalException e){
        e.printStackTrace();
        return R.error().code(e.getCode()).message(e.getMessage());
    }

}
