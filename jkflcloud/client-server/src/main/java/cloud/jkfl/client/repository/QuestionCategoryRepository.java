/***********************************************************
 * @Description : 
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.repository;

import cloud.jkfl.client.entity.QuestionCategory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionCategoryRepository extends JpaRepository<QuestionCategory, Integer> {
}
