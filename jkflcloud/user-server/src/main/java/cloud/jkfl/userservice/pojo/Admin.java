package cloud.jkfl.userservice.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin {

    @JsonSerialize(using = ToStringSerializer.class)
    @TableId(value = "admin_id", type = IdType.ASSIGN_ID)
    private Long id;

    @TableField(value = "admin_name")
    private String name;

    @TableField(value = "admin_sex")
    private String sex;

    @TableField(value = "admin_tel")
    private Long tel;

    @TableField(value = "admin_email")
    private String email;

    @TableField(value = "admin_pwd")
    private String pwd;

    @TableField(value = "admin_identity_card")
    private Long identityCard;

    @TableField(value = "admin_role")
    private String role;

    @TableField(value = "admin_create_time", fill = FieldFill.INSERT)
    private Date createTime;

    @TableField(value = "admin_update_time", fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @TableLogic
    @TableField(value = "admin_deleted", fill = FieldFill.INSERT)
    private Integer deleted;

    @Version
    @TableField(value = "admin_version", fill = FieldFill.INSERT_UPDATE)
    private Integer version;

    @TableField(value = "admin_description")
    private String description;

}
