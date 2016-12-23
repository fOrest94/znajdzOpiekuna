package info.znOpk.service;

import info.znOpk.model.News;
import info.znOpk.repository.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-23.
 */

@Component
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsRepository newsRepository;

    @Override
    public List<News> findAllNews() {
        return newsRepository.findAll();
    }

    @Override
    public void saveNews(News news) {
        if (newsRepository.findById(news.getId()) == null)
            newsRepository.save(news);
    }

    @Override
    public boolean deleteNews(Long id) {

        if (newsRepository.findById(id) == null) {
            return false;
        } else {
            newsRepository.delete(id);
            return true;
        }

    }

    @Override
    public News editNews(Long id) {

        return newsRepository.findById(id);

    }


}
