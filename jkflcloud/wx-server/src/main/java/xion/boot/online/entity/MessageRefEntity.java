package xion.boot.online.entity;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;

@Data
@Document(collection = "message_ref")
public class MessageRefEntity implements Serializable {

    @Id
    private String _id;

    @Indexed
    private String messageId;//message记录的Id

    @Indexed
    private Integer receiverId;//接收者Id

    @Indexed
    private Boolean readFlag;//是否被接受

    @Indexed
    private Boolean lastFlag;

}
