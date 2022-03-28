package cloud.jkfl.examservice.pojo.vo;


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

    private List<Long> sqList;
    private List<Long> mqList;
    private List<Long> jqList;
    private List<Long> iqList;
    private List<Long> saqList;
    private List<Long> pqList;

}
