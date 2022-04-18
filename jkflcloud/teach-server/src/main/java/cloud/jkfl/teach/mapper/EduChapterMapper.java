package cloud.jkfl.teach.mapper;

import cloud.jkfl.teach.pojo.EduChapter;
import cloud.jkfl.teach.pojo.vo.ChapterVo;
import cloud.jkfl.teach.pojo.vo.EduChapterBlobVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface EduChapterMapper extends BaseMapper<EduChapter> {


    @Select("select * from edu_chapter where chapter_id = #{id}")
    EduChapterBlobVo getChapterById(String id);


    @Select("select * from edu_chapter where novel_id = #{id} order by chapter_sort asc")
    List<ChapterVo> getChapterWithNovelId(String id);


    @Select("select * from edu_chapter order by chapter_sort asc")
    List<ChapterVo> getAllChapter();
}
