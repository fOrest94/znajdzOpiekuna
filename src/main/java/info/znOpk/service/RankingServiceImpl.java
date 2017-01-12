package info.znOpk.service;

import info.znOpk.model.User;
import info.znOpk.repository.RankingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by DuduŚ on 2016-12-30.
 */
@Component
public class RankingServiceImpl implements RankingService {

    @Autowired
    private RankingRepository rankingRepository;

    @Override
    public List<User> getTopOffers() {

        Pageable topTen = new PageRequest(0, 6);
        return rankingRepository.findOfferByMark( topTen);
    }

    @Override
    public List<User> getTopCare() {
        Pageable topTen = new PageRequest(0, 6);
        return rankingRepository.findCareByMark(topTen);
    }
}
