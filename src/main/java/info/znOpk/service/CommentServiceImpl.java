package info.znOpk.service;

import info.znOpk.model.Comment;
import info.znOpk.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-24.
 */
@Component
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentRepository commentRepository;

    @Override
    public List<Comment> getComments(Long newsId) {
        return commentRepository.getCommentByNewsId(newsId);
    }

    @Override
    public List<Comment> getComments1(Long commentedId) {
        return commentRepository.getCommentByCommentedId(commentedId);
    }

    @Override
    public void saveComment(Comment comment) {
        commentRepository.save(comment);
    }
}
