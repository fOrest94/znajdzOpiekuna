package info.znOpk.repository;

import info.znOpk.model.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-27.
 */
public interface MessageRepository extends JpaRepository<Message,Long>{
    List<Message> getMessageByIdRecipient(Long id);
    Message getMessageById(Long id);

    @Query("select m from Message m where m.idRecipient =?1 and m.received =1")
    List<Message> getUnreadMessById(Long id);
}
