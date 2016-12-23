package info.znOpk.service;

import info.znOpk.model.News;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-23.
 */
public interface NewsService {

    List<News> findAllNews();
    void saveNews(News news);
    boolean deleteNews(Long id);
    News editNews(Long id);
}
