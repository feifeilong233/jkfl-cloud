/***********************************************************
 * @Description : 
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.repository;

import cloud.jkfl.client.entity.Exam;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ExamRepository extends JpaRepository<Exam, String> {
    Exam findByExamId(Long id);
    @Query("select e from Exam e order by e.updateTime desc")
    List<Exam> findAll();
}
