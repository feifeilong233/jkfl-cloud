package cloud.jkfl.userservice.pojo.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class TeacherQuery {

    @ApiModelProperty(value = "老师姓名, 模糊查询")
    private String name;

    @ApiModelProperty(value = "老师级别 1 - 低级老师  2 - 班主任？  3 - 高级老师")
    private int type;

    /**
     * 一定要是String类型！否则前台的数据无法转换
     */
    @ApiModelProperty(value = "开始查询时间", example = "2021-12-01 00:00:00")
    private String start;

    @ApiModelProperty(value = "结束查询时间", example = "2021-12-02 00:00:00")
    private String end;

}
