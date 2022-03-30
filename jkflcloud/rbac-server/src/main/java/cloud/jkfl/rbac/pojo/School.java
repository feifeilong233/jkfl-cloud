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
public class School {

    @JsonSerialize(using = ToStringSerializer.class)
    @TableId(value = "school_id",type = IdType.ASSIGN_ID)
    private Long schoolId;

    @TableField(value = "school_title")
    private String schoolTitle;

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

    @TableField(value = "school_pid")
    private String schoolPid;

    @TableField(value = "school_key")
    private String schoolKey;


}
