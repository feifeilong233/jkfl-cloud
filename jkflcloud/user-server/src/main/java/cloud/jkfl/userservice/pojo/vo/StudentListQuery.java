package cloud.jkfl.userservice.pojo.vo;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StudentListQuery {

    private String className;

    private String userName;

    //@JsonSerialize(using = ToStringSerializer.class)
    //private String id;

    @JsonSerialize(using = ToStringSerializer.class)
    private Long pid;
    private String email;
    private String tel;
    private String stuName;

}
