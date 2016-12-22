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
    List<User> findByUserTypeAndTown(@Param("userType") Integer userType, @Param("town") String town);

    @Query("select u from User u where u.userType like :userType and u.zipCode like :zipCode")
    List<User> findByUserTypeAndZipCode(@Param("userType") Integer userType, @Param("zipCode") String zipCode);

   /* @Query("select u from User u inner join OfferCare o on u.id = o.userId where o.:typeOfWork = 1 and u.zipCode = :zipCode")
    List<User> findByUserTypeAndTypeOfWorkAndZipCode(@Param("userType") String userType, @Param("typeOfWork") String typeOfWork, @Param("zipCode") String zipCode);

    @Query("select u from User u inner join OfferCare o on u.id = o.userId where o.:typeOfWork = 1 and u.town = :town")
    List<User> findByUserTypeAndTypeOfWorkAndTown(@Param("userType") String userType, @Param("typeOfWork") String typeOfWork, @Param("town") String town);*/
}
/*
SELECT *
        FROM uzytkownik
        INNER JOIN szukajacy_opieki
        ON uzytkownik.id=szukajacy_opieki.id_uzytkownika where szukajacy_opieki.opieka_niania =1*/