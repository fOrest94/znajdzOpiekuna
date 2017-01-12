package info.znOpk.repository;

import info.znOpk.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;

public interface UserRepository extends JpaRepository<User, Long> {

    @Transactional
    @Modifying()
    @Query("UPDATE User c SET c.active = :active WHERE c.id = :id")
    int updateActive(@Param("active") Integer active, @Param("id") Long id);

    @Transactional
    @Modifying()
    @Query("UPDATE User c SET c.moneyPerHour = :moneyPerHour WHERE c.id = :id")
    int updateSalary(@Param("moneyPerHour") String moneyPerHour, @Param("id") Long id);

    @Transactional
    @Modifying()
    @Query("UPDATE User c SET c.identity = 1 WHERE c.id = :id")
    int updateIdentity(@Param("id") Long id);

    User findByUsername(String username);

    User findById(Long id);

    User findOne(Long id);
}
