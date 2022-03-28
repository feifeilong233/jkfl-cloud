package cloud.jkfl.servicebase.handler;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.bind.annotation.ControllerAdvice;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GlobalException extends RuntimeException{

    @ApiModelProperty(value = "状态码")
    private Integer code;

    private String msg;

}
