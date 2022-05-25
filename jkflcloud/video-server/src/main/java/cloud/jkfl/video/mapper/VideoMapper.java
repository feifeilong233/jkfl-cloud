package cloud.jkfl.video.mapper;

import cloud.jkfl.video.pojo.EduVideo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface VideoMapper extends BaseMapper<EduVideo> {


    @Select("select * from edu_video order by rand() desc limit 8 ")
    public List<EduVideo> selectIndexData1();

    @Select("select * from edu_video order by rand() desc limit 6 ")
    public List<EduVideo> selectIndexData2();

    @Select("select * from edu_video order by rand() desc limit 2 ")
    public List<EduVideo> selectIndexData3();

}
