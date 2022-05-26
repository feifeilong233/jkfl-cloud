package cloud.jkfl.teach.pojo;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EduNovel {

    @TableId(value = "novel_id", type = IdType.ASSIGN_UUID)
    private String novelId;

    @TableField(value = "novel_cover")
    private String novelCover;

    @TableField(value = "novel_title")
    private String novelTitle;

    @TableField(value = "novel_type")
    private String novelType;

    @TableField(value = "novel_format")
    private String novelFormat;

    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @TableField(value = "deleted", fill=FieldFill.INSERT)
    @TableLogic
    private Integer deleted;

    @TableField(value = "version", fill = FieldFill.INSERT)
    @Version
    private Integer version;


}
