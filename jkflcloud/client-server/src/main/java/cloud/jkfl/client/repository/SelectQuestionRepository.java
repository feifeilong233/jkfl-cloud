/***********************************************************
 * @Description : 
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.repository;

import cloud.jkfl.client.entity.SelectQuestion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface SelectQuestionRepository extends JpaRepository<SelectQuestion, Long> {
    @Query("select sq from SelectQuestion sq order by sq.updateTime desc")
    List<SelectQuestion> findAll();
}
