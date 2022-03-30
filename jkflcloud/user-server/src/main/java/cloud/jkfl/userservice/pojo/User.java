package cloud.jkfl.userservice.pojo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

    @TableId(value = "user_id", type = IdType.ASSIGN_UUID)
    private String userId;

    @TableField(value = "user_username")
    private String userUsername;

    @TableField(value = "user_nickname")
    private String userNickname;

    @TableField(value = "user_password")
    private String userPassword;

    @TableField(value = "user_role_id")
    private Integer userRoleId;

    @TableField(value = "user_avatar")
    private String userAvatar;

    @TableField(value = "user_description")
    private String userDescription;

    @TableField(value = "user_email")
    private String userEmail;

    @TableField(value = "user_phone")
    private String userPhone;

    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @TableField(value = "class_id")
    private Long classId;

    @TableField(value = "user_identity_card")
    private String userIdentityCard;

    @TableField(value = "user_sex")
    private String userSex;

    @TableField(value = "user_school")
    private String userSchool;

    @TableField(value = "user_academy")
    private String userAcademy;

    @TableField(value = "user_address")
    private String userAddress;

    @TableField(value = "user_pid")
    private Long userPid;

    @TableField(value = "user_major")
    private String userMajor;

    @TableField(value = "user_institute")
    private String userInstitute;

}
