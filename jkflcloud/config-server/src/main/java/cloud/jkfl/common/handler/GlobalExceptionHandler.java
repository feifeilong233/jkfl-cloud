package cloud.jkfl.common.handler;



import cloud.jkfl.common.utils.R;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;


@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(cloud.jkfl.common.handler.GlobalException.class)
    @ResponseBody
    public R error(cloud.jkfl.common.handler.GlobalException e){
        e.printStackTrace();
        return R.error().code(e.getCode()).message(e.getMessage());
    }

}
