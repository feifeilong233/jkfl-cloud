/***********************************************************
 * @Description : 
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.repository;

import cloud.jkfl.client.entity.ProgramQuestion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProgramQuestionRepository extends JpaRepository<ProgramQuestion, Long> {
    @Query("select pq from ProgramQuestion pq order by pq.updateTime desc")
    List<ProgramQuestion> findAll();
}
