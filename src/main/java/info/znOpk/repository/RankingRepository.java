package info.znOpk.repository;

import info.znOpk.model.User;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import java.util.List;

/**
 * Created by DuduŚ on 2016-12-30.
 */
public interface RankingRepository extends JpaRepository<User,Long>{

    @Query("select u from User u where u.userType = 2 order by u.mark desc")
    List<User> findCareByMark(Pageable pageable);

    @Query("select u from User u where u.userType = 1 order by u.mark desc")
    List<User> findOfferByMark(Pageable pageable);

    List<User> findTop3ByUserTypeOrderByMarkDesc(String userType);



}
