package cloud.jkfl.userservice.pojo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StudentListQuery {

    private String className;
    private Long id;
    private Long pid;
    private String email;
    private Long tel;
    private String stuName;

}
