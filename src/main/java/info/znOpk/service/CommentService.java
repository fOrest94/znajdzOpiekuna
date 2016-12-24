package info.znOpk.service;

import info.znOpk.model.Comment;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-24.
 */
public interface CommentService {

    List<Comment> getComments(Long newsId);
    void saveComment(Comment comment);

}
