package info.znOpk.repository;

import info.znOpk.model.Nanny;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by DuduŚ on 2016-12-13.
 */
public interface CareRepository extends JpaRepository<Nanny, Long> {
    Nanny findByUserId(Long id);
}