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
public class EduUserBook {

    @TableId(value = "ub_id", type= IdType.ASSIGN_UUID)
    private String ubId;

    @TableField(value = "novel_id")
    private String novelId;

    @TableField(value = "user_id")
    private String userId;

    @TableField(value = "nb_chapter_id")
    private String nbChapterId;

}
