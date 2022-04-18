package cloud.jkfl.teach.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EduExtInfo {

    @TableId(value = "ext_info_id", type = IdType.ASSIGN_UUID)
    private String extInfoId;

    @TableField(value = "novel_id")
    private String novelId;

    @TableField(value = "ext_collection")
    private Integer extCollection;

    @TableField(value = "ext_download")
    private Integer extDownload;

    @TableField(value = "ext_click")
    private Integer extClick;

}
