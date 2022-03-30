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
public class Academy {

    @JsonSerialize(using = ToStringSerializer.class)
    @TableId(value = "academy_id" ,type = IdType.ASSIGN_ID)
    private Long academyId;

    @TableField(value = "academy_title")
    private String academyTitle;

    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @TableField(value = "deleted", fill = FieldFill.INSERT)
    @TableLogic
    private Integer deleted;

    @TableField(value = "version", fill = FieldFill.INSERT)
    @Version
    private Integer version;

    @TableField(value = "academy_pid")
    private String academyPid;

    @TableField(value = "academy_key")
    private String academyKey;

    @JsonSerialize(using = ToStringSerializer.class)
    @TableField(value = "academy_school_id")
    private Long academySchoolId;


}
