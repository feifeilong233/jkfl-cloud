/***********************************************************
 * @Description : 
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.repository;

import cloud.jkfl.client.entity.ShortAnswerQuestion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ShortAnswerQuestionRepository extends JpaRepository<ShortAnswerQuestion, Long> {
    @Query("select saq from ShortAnswerQuestion saq order by saq.updateTime desc")
    List<ShortAnswerQuestion> findAll();
}
