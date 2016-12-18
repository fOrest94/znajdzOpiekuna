package info.znOpk.repository;

import info.znOpk.model.SearchCare;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by DuduŚ on 2016-12-18.
 */
public interface SearchCareRepository extends JpaRepository<SearchCare, Long> {
   //SearchCare findByUserId(Long id);
}
