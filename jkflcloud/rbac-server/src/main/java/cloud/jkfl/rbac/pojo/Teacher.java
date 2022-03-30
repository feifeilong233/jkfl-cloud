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
public class Teacher {

    @JsonSerialize(using = ToStringSerializer.class)
    @TableId(value = "tea_id",type = IdType.ASSIGN_ID)
    private Long teaId;

    @TableField(value = "tea_name")
    private String teaName;

    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    @Version
    @TableField(value = "version", fill = FieldFill.INSERT_UPDATE)
    private Integer version;

    @TableField(value = "tea_tel")
    private Long teaTel;

    @TableField(value = "tea_institute")
    private String teaInstitute;

    @TableField(value = "tea_identity_card")
    private Long teaIdentityCard;

    @TableField(value = "tea_email")
    private String teaEmail;

    @TableLogic
    @TableField(value = "deleted",fill = FieldFill.INSERT)
    private Integer deleted;

    @TableField(value = "tea_sex")
    private String teaSex;

    @TableField(value = "tea_pwd")
    private String teaPwd;

    @TableField(value = "tea_role")
    private String teaRole;

    @TableField(value = "tea_job")
    private String teaJob;

    @TableField(value = "tea_school")
    private String teaSchool;

    @TableField(value = "tea_academy")
    private String teaAcademy;

    @TableField(value = "tea_description")
    private String teaDescription;

    @TableField(value = "tea_address")
    private String teaAddress;

}
