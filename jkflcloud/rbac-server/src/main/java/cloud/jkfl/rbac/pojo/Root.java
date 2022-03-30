package cloud.jkfl.rbac.pojo;


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
@TableName(value = "admin", autoResultMap = true)
public class Root {

    @JsonSerialize(using = ToStringSerializer.class)
    @TableId(value = "admin_id", type = IdType.ASSIGN_ID)
    private Long adminId;

    @TableField(value = "admin_name")
    private String adminName;

    @TableField(value = "admin_sex")
    private String adminSex;

    @TableField(value = "admin_tel")
    private Long adminTel;

    @TableField(value = "admin_email")
    private String adminEmail;

    @TableField(value = "admin_pwd")
    private String adminPwd;

    @JsonSerialize(using = ToStringSerializer.class)
    @TableField(value = "admin_identity_card")
    private Long adminIdentityCard;

    @TableField(value = "admin_role")
    private String adminRole;

    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @TableLogic
    @TableField(value = "deleted", fill = FieldFill.INSERT)
    private Integer deleted;

    @Version
    @TableField(value = "version", fill = FieldFill.INSERT)
    private Integer version;

    @TableField(value = "admin_description")
    private String adminDescription;

}
