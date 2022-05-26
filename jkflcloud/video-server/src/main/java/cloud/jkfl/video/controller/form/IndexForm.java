package cloud.jkfl.video.controller.form;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class IndexForm {

    private String id;
    private String photo;
    private String path;

    private String title;

    private String good;
    private String watch;
    private String label;
    private Date time;

}
