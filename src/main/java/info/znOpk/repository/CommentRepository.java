package info.znOpk.repository;

import info.znOpk.model.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-24.
 */
public interface CommentRepository extends JpaRepository<Comment,Long>{
    List<Comment> getCommentByNewsId(Long newsId);
    List<Comment> getCommentByCommentedId(Long newsId);

}
