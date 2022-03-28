/***********************************************************
 * @Description : 角色的实体类
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

@Data
public class RoleVo {
    @JsonProperty("id")
    private String roleName;

    @JsonProperty("name")
    private String roleDescription;

    @JsonProperty("describe")
    private String roleDetail;

    @JsonProperty("permissions")
    private List<PageVo> pageVoList;
}
