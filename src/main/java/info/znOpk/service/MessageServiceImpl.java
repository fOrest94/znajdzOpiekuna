package info.znOpk.service;

import info.znOpk.model.Message;
import info.znOpk.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-27.
 */
@Component
public class MessageServiceImpl implements MessageService{

    @Autowired
    MessageRepository messageRepository;

    @Override
    public void save(Message message) {

        messageRepository.save(message);
    }

    @Override
    public List<Message> getAll() {
        return null;
    }

    @Override
    public List<Message> getUnreceived() {
        return null;
    }
}
