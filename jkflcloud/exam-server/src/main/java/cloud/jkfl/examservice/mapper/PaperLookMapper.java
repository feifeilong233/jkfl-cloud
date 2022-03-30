package cloud.jkfl.examservice.mapper;

import cloud.jkfl.examservice.pojo.PaperLook;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface PaperLookMapper extends BaseMapper<PaperLook> {


    @Select("select paper_look_id from paper_look where paper_look_title = #{paperName}")
    Long getIdWithName(String paperName);


    @Select("select * from paper_look where paper_look_title = #{paperName}")
    PaperLook getWithName(String paperName);
}
