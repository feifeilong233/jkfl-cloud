package cloud.jkfl.client.repository;

import cloud.jkfl.client.entity.PaperManage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PaperManageRepository extends JpaRepository<PaperManage, String> {
    List<PaperManage> findByPaperIdAndPaperQuestionType(Long paperId, Integer id);
    @Query("select p from PaperManage p order by p.updateTime desc")
    List<PaperManage> findAll();
}
