package cloud.jkfl.examservice.pojo.vo;


import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ItemManualQuery {

    private String title;
    private Integer total;
    private String time;

    @JsonSerialize(using = ToStringSerializer.class)
    private List<Long> sqList;

    @JsonSerialize(using = ToStringSerializer.class)
    private List<Long> mqList;

    @JsonSerialize(using = ToStringSerializer.class)
    private List<Long> jqList;

    @JsonSerialize(using = ToStringSerializer.class)
    private List<Long> iqList;

    @JsonSerialize(using = ToStringSerializer.class)
    private List<Long> saqList;

    @JsonSerialize(using = ToStringSerializer.class)
    private List<Long> pqList;

}
