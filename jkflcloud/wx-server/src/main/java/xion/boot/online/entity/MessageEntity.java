package xion.boot.online.entity;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;
import java.util.Date;

/**
 * message集合记录消息
 */
@Data
@Document(collection = "message")
public class MessageEntity implements Serializable {


    @Id
    private String _id;

    @Indexed(unique = true)
    private String uuid;

    @Indexed
    private Integer senderId;

    private String senderPhoto = "https://s1.ax1x.com/2022/05/24/XPxVpT.jpg";

    private String senderName;

    @Indexed
    private Date sendTime;

    private String msg;

}
