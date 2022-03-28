package cloud.jkfl.rbac.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SysOptChildVO {

    private Long id;
    private String title;
    private Date createTime;
    private Date updateTime;
    private String pid;
    private String key;


}
