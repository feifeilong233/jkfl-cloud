package cloud.jkfl.examservice.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScoreVo {

    private String nickname;

    private Integer join;

    private Integer sub;

    private Integer total;

    private String title;

    private String pid;

}
