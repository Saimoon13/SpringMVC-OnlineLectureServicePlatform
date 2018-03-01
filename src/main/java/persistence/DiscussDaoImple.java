package persistence;

import domain.Lecture;
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
    public List<Lecture> selectAllcate() {
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


}
