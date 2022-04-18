package cloud.jkfl.teach.mapper;

import cloud.jkfl.teach.pojo.EduChapter;
import cloud.jkfl.teach.pojo.EduUserBook;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface EduUserBookMapper extends BaseMapper<EduUserBook> {

    @Select("select novel_id from edu_user_book where user_id=#{userId}")
    List<String> getNovelsWithUserId(String userId);

    @Select("select * from edu_user_book where user_id=#{userId} and novel_id=#{novelId}")
    EduUserBook getChapterIdWithUN(String userId, String novelId);
}
