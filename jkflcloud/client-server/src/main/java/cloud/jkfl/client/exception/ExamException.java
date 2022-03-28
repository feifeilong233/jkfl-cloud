/***********************************************************
 * @Description : 
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.exception;

import cloud.jkfl.client.enums.ResultEnum;
import lombok.Getter;

@Getter
public class ExamException extends RuntimeException {
    private Integer code;

    public ExamException(ResultEnum resultEnum) {
        super(resultEnum.getMessage());
        this.code = resultEnum.getCode();
    }

    public ExamException( Integer code, String message) {
        super(message);
        this.code = code;
    }
}
