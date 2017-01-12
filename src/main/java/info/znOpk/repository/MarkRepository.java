package info.znOpk.repository;

import info.znOpk.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;

/**
 * Created by DuduŚ on 2017-01-11.
 */
public interface MarkRepository extends JpaRepository<User, Long>{

    User getUserById(Long id);

    @Transactional
    @Modifying
    @Query("update User u set u.mark = ?1, u.mark_quantity = ?2 where u.id = ?3")
    void updateMark(String xd, int mark_quantity, Long id);
}
