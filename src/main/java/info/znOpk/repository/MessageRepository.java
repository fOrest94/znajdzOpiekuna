package info.znOpk.repository;

import info.znOpk.model.Message;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-27.
 */
public interface MessageRepository extends JpaRepository<Message,Long>{
    List<Message> getMessageByIdRecipient(Long id);
}
