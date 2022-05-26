package cloud.jkfl.teach.pojo.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.JdbcType;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EduChapterBlobVo {

    @TableId(value = "chapter_id")
    private String chapterId;

    private String novelId;

    private String chapterName;

    @TableField(
            value = "chapter_content",
            jdbcType = JdbcType.BLOB,
            typeHandler = org.apache.ibatis.type.BlobTypeHandler.class
    )
    private String chapterContent;

    private Integer chapterSort;

}
