/***********************************************************
 * @Description : 
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.repository;

import cloud.jkfl.client.entity.MultipleQuestion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface MultipleQuestionRepository extends JpaRepository<MultipleQuestion, Long> {
    @Query("select mq from SelectQuestion mq order by mq.updateTime desc")
    List<MultipleQuestion> findAll();
}
