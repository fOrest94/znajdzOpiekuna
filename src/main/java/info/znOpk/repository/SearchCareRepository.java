package info.znOpk.repository;

import info.znOpk.model.SearchCare;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;

/**
 * Created by DuduŚ on 2016-12-18.
 */
public interface SearchCareRepository extends JpaRepository<SearchCare, Long> {
   SearchCare findByUserId(Long id);

   @Transactional
   @Modifying
   @Query("update SearchCare u set u.whoWannCareNanny = ?1, u.whoWannCareOld = ?2, u.writeSthAboutYou = ?3, u.moneyPerHour = ?4, u.workWithHome = ?5 where u.userId = ?6")
   void setSearchCareById(String whoWannCareNanny, String whoWannCareOld, String writeSthAboutYou, String moneyPerHour, String workWithHome, Long userId);
}
