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
public class Class {

    @JsonSerialize(using = ToStringSerializer.class)
    @TableId(value = "class_id", type = IdType.ASSIGN_ID)
    private Long classId;

    @TableField(value = "class_name")
    private String className;

    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    @Version
    @TableField(value = "version", fill = FieldFill.INSERT_UPDATE)
    private Integer version;

    @TableLogic
    @TableField(value = "deleted", fill = FieldFill.INSERT)
    private Integer deleted;


}
