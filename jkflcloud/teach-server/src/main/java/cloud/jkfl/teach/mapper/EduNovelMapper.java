package cloud.jkfl.teach.mapper;

import cloud.jkfl.teach.pojo.EduNovel;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface EduNovelMapper extends BaseMapper<EduNovel> {

    @Select("<script>" +
            "select * from edu_novel where novel_title like concat('%',#{input},'%') " +
            "and novel_format = #{format}" +
            "and novel_id in (select novel_id from edu_user_book where user_id = #{userId})" +
            "</script>")
    List<EduNovel> getListWithUFI(String userId, String format, String input);
}
