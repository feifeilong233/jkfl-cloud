package cloud.jkfl.userservice.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReadVo {

    private String userNickname;

    private Long userPid;

    private String status;

}
