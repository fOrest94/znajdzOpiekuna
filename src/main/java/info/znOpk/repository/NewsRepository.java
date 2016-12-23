package info.znOpk.repository;

import info.znOpk.model.News;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by DuduŚ on 2016-12-23.
 */
public interface NewsRepository extends JpaRepository<News, Long> {

    News findById(Long id);
}
