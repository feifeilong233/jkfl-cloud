package cloud.jkfl.video.mapper;

import cloud.jkfl.video.pojo.EduVideoInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface VideoInfoMapper extends BaseMapper<EduVideoInfo> {


    @Select("select * from edu_video_info where vdo_id = #{id}")
    public abstract List<EduVideoInfo> getVideoInfoWithId(String id);

}
