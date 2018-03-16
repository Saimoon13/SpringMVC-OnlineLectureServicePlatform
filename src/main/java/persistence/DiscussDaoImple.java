package persistence;

import domain.Discuss;
import domain.Topics;
import mappers.DiscussMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pageutil.PaginationCriteria;

import java.util.Date;
import java.util.List;

@Repository
public class DiscussDaoImple implements DiscussDao {

    @Autowired private DiscussMapper mapper;

    @Override
    public List<Discuss> selectAllcate() {
        return mapper.selectAllcate();
    }

    @Override
    public List<Topics> selectTopicsByLid(String lid) {
        return mapper.selectTopicsByLid(lid);
    }

    @Override
    public int insert(Topics topics) {
        return mapper.insertTopic(topics);
    }

    @Override
    public int getCountByLid(String lid) {
        return mapper.getCountByLid(lid);
    }

    @Override
    public List<Topics> selectPage(String lid, PaginationCriteria c) {
        return mapper.selectPage(lid, c);
    }

    @Override
    public Topics selectTopicByTnumber(int tnumber) {
        return mapper.selectTopicByTnumber(tnumber);
    }

    @Override
    public int updateLast(String writer, int tnumber, String title, String lid) {
        return mapper.updateLastJson(writer, tnumber, title, lid);
    }

    @Override
    public int updateViews(int tnumber) {
        return mapper.updateViews(tnumber);
    }

    @Override
    public int updateTopic(Topics topics) {
        return mapper.updateTopic(topics);
    }

    @Override
    public int deleteTopic(int tnumber) {
        return mapper.deleteTopic(tnumber);
    }

    @Override
    public int searchCountTopicsByLid(String searchType, String searchKeyword, String lid) {
        return mapper.searchCountTopicsByLid(searchType, searchKeyword, lid);
    }

    @Override
    public int updateTopicCount(String lid) {
        return mapper.updateTopicCount(lid);
    }

    @Override
    public int selectLastTnumber(String writer, Date topicdate) {
        return mapper.selectLastTnumber(writer, topicdate);
    }

    @Override
    public int topicTotalCount() {
        return mapper.topicTotalCount();
    }

}
