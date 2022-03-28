package cloud.jkfl.examservice.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InputVo {

    /**
     * subject和number
     * 通过list集合整合，统一录入
     * {
     *     iqSubject: 'js基础',//知识点类型
     *     iqNumber: 2,//数量
     * }
     * */
    private String iqSubject;
    private Integer iqNumber;

}
