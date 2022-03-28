package cloud.jkfl.rbac.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SysOptVO {

    private Long id;
    private String title;
    private String pid;
    private String key;
    private Date createTime;
    private Date updateTime;
    private List<SysOptChildVO> children;


}
