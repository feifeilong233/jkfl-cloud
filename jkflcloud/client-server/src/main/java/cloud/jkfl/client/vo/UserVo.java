/***********************************************************
 * @Description : 用户信息的展示类,通过JsonProperty来简化返回
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

@Data
public class UserVo {
    @JsonProperty("id")
    private String userId;

    @JsonProperty("username")
    private String userUsername;

    @JsonProperty("nickname")
    private String userNickname;

    @JsonProperty("role")
    private Integer userRoleId;

    @JsonProperty("avatar")
    private String userAvatar;

    @JsonProperty("description")
    private String userDescription;

    @JsonProperty("email")
    private String userEmail;

    @JsonProperty("phone")
    private String userPhone;

    @JsonProperty("class")
    @JsonSerialize(using = ToStringSerializer.class)
    private Long classId;
}
