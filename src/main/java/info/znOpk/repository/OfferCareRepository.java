package info.znOpk.repository;

import info.znOpk.model.OfferCare;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by DuduŚ on 2016-12-13.
 */
public interface OfferCareRepository extends JpaRepository<OfferCare, Long> {
    OfferCare findByUserId(Long id);
}