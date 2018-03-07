package service;

import domain.Lecture;
import domain.Topics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pageutil.PaginationCriteria;
import persistence.DiscussDao;

import java.util.Date;
import java.util.List;

@Service
public class DiscussServiceimple implements DiscussService {

    @Autowired private DiscussDao discussDao;

    @Override
    public List<Lecture> selectAll() {
        return discussDao.selectAllcate();
    }

    @Override
    public List<Topics> selectTopicsByLid(String lid) {
        return discussDao.selectTopicsByLid(lid);
    }

    @Override
    public int insertTopic(Topics topics) {
        return discussDao.insert(topics);
    }

    @Override
    public int getCountByLid(String lid) {
        return discussDao.getCountByLid(lid);
    }

    @Override
    public List<Topics> selectPage(String lid, PaginationCriteria c) {
        return discussDao.selectPage(lid, c);
    }

    @Override
    public Topics selectTopicByTnumber(int tnumber) {
        return discussDao.selectTopicByTnumber(tnumber);
    }

    @Override
    public int updateLast(String writer, int tnumber, String title, String lid) {
        return discussDao.updateLast(writer, tnumber, title, lid);
    }
    @Override
    public int updateViews(int tnumber) {
        return discussDao.updateViews(tnumber);
    }

    @Override
    public int updateTopic(Topics topics) {
        return discussDao.updateTopic(topics);
    }

    @Override
    public int deleteTopic(int tnumber) {
        return discussDao.deleteTopic(tnumber);
    }

    @Override
    public List<Topics> searchTopicsByLid(int searchType, String searchKeyword, String lid) {
        return discussDao.searchTopicsByLid(searchType, searchKeyword, lid);
    }

    @Override
    public int searchCountTopicsByLid(String searchType, String searchKeyword, String lid) {
        return discussDao.searchCountTopicsByLid(searchType, searchKeyword, lid);
    }

}
