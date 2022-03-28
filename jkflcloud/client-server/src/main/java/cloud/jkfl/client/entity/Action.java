/***********************************************************
 * @Description : 前端的操作
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Data
@Entity
public class Action {
    @Id
    @GeneratedValue
    private Integer actionId;

    private String actionName;

    private String actionDescription;

    private Boolean defaultCheck;
}
