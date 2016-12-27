package info.znOpk.service;

import info.znOpk.model.Message;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-27.
 */
public interface MessageService {

    void save(Message message);
    List<Message> getMessagesById(Long id);
    List<Message> getUnreceived();
}
