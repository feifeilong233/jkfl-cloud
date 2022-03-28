/***********************************************************
 * @Description : 
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.repository;

import cloud.jkfl.client.entity.JudgeQuestion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface JudgeQuestionRepository extends JpaRepository<JudgeQuestion, Long> {
    @Query("select jq from SelectQuestion jq order by jq.updateTime desc")
    List<JudgeQuestion> findAll();
}
