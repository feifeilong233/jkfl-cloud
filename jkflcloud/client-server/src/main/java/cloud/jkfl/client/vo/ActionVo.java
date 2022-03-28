/***********************************************************
 * @Description : Action的前端展示类
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class ActionVo {
    @JsonProperty("action")
    private String actionName;

    @JsonProperty("describe")
    private String actionDescription;

    @JsonProperty("defaultCheck")
    private Boolean defaultCheck;
}
