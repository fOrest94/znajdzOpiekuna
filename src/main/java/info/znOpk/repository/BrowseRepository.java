package info.znOpk.repository;

import info.znOpk.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-14.
 */
public interface BrowseRepository extends JpaRepository<User, Long> {

    @Query("select u from User u where u.userType like :userType and u.town like :town")
    List<User> findByUserTypeAndTown(@Param("userType") String userType, @Param("town") String town);

    @Query("select u from User u where u.userType like :userType and u.zipCode like :zipCode")
    List<User> findByUserTypeAndZipCode(@Param("userType") String userType,@Param("zipCode") String zipCode);
}