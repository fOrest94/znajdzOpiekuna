package info.znOpk.repository;

import info.znOpk.model.News;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;

/**
 * Created by DuduŚ on 2016-12-23.
 */
public interface NewsRepository extends JpaRepository<News, Long> {

    News findById(Long id);

    @Query("select u from News u where u.data = (select max(u.data) from News u )")
    News findByData();
}
