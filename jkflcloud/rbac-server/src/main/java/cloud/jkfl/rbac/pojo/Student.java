package cloud.jkfl.rbac.pojo;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;


/**
 * 2022-3-28 断开
 * */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student {

    @JsonSerialize(using = ToStringSerializer.class)
    @TableId(value = "stu_id",type = IdType.ASSIGN_ID)
    private Long stuId;

    @TableField(value = "stu_name")
    private String stuName;

    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @Version
    @TableField(value = "version", fill = FieldFill.INSERT)
    private Integer version;

    @TableField(value = "stu_tel")
    private Long stuTel;

    @TableField(value = "stu_email")
    private String stuEmail;

    @TableField(value = "stu_institute")
    private String stuInstitute;

    @TableField(value = "stu_major")
    private String stuMajor;

    @JsonSerialize(using = ToStringSerializer.class)
    @TableField(value = "stu_identity_card")
    private Long stuIdentityCard;

    @TableField(value = "deleted")
    @TableLogic
    private Integer deleted;

    @TableField(value = "stu_level")
    private String stuLevel;

    @TableField(value = "stu_sex")
    private String stuSex;

    @TableField(value = "stu_pwd")
    private String stuPwd;

    @TableField(value = "stu_clazz")
    private String stuClazz;

    @TableField(value = "stu_grade")
    private String stuGrade;

    @TableField(value = "stu_school")
    private String stuSchool;

    @TableField(value="stu_academy")
    private String stuAcademy;

    @TableField(value="stu_description")
    private String stuDescription;

    @TableField(value="stu_address")
    private String stuAddress;

}
