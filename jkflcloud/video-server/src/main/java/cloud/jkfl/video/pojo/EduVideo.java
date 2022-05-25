package cloud.jkfl.video.pojo;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EduVideo {

    @TableId(value = "vdo_id", type = IdType.ASSIGN_UUID)
    private String vdoId;

    @TableField(value = "vdo_name")
    private String vdoName;

    /**存用户的微信openid
     * */
    @TableField(value = "vdo_author_id")
    private String vdoAuthorId;

    @TableField(value = "vdo_photo")
    private String vdoPhoto;

    @TableField(value = "vdo_path")
    private String vdoPath;

    @TableField(value = "vdo_label")
    private String vdoLabel;


    @TableField(value = "create_time", fill = FieldFill.INSERT)

    private Date createTime;

    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @TableField(value = "version", fill = FieldFill.INSERT)
    @Version
    private Integer version;

    @TableField(value = "deleted", fill = FieldFill.INSERT)
    @TableLogic
    private Integer deleted;


    @TableField(value = "vdo_collection")
    private String vdoCollection;
}
