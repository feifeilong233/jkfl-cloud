/***********************************************************
 * @Description : 
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.repository;

import cloud.jkfl.client.entity.InputQuestion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface InputQuestionRepository extends JpaRepository<InputQuestion, Long> {
    @Query("select iq from InputQuestion iq order by iq.updateTime desc")
    List<InputQuestion> findAll();
}
