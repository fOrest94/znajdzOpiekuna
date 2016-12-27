package info.znOpk.repository;

import info.znOpk.model.Message;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by DuduŚ on 2016-12-27.
 */
public interface MessageRepository extends JpaRepository<Message,Long>{
}
