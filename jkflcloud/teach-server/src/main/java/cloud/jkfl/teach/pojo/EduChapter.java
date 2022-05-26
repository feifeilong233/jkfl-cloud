package cloud.jkfl.teach.pojo;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.JdbcType;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EduChapter {

    @TableId(value = "chapter_id", type = IdType.ASSIGN_UUID)
    private String chapterId;

    @TableField(value = "novel_id")
    private String novelId;

    @TableField(value = "chapter_name")
    private String chapterName;

    @TableField(
            value = "chapter_content"
    )
    private String chapterContent;

    @TableField(value = "create_time",fill = FieldFill.INSERT)
    private Date createTime;

    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @TableField(value = "deleted", fill = FieldFill.INSERT)
    @TableLogic
    private Integer deleted;

    @TableField(value = "version", fill = FieldFill.INSERT)
    @Version
    private Integer version;

    @TableField(value = "chapter_sort")
    private Integer chapterSort;

}
