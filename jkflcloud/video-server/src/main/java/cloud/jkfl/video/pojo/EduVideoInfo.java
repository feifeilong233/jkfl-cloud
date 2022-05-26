package cloud.jkfl.video.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EduVideoInfo {

    @TableId(value = "vdo_info_id", type = IdType.ASSIGN_UUID)
    private String vdoInfoId;

    @TableField(value = "vdo_id")
    private String vdoId;

    @TableField(value = "vdo_info_watch")
    private Integer vdoInfoWatch;

    @TableField(value = "vdo_info_good")
    private Integer vdoInfoGood;

    @TableField(value = "vdo_info_collect")
    private Integer vdoInfoCollect;

}
