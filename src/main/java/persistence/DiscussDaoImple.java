package persistence;

import domain.Lecture;
import domain.Topics;
import mappers.LectureMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pageutil.PaginationCriteria;

import java.util.List;

@Repository
public class DiscussDaoImple implements DiscussDao {

    @Autowired private LectureMapper mapper;

//    private static final String NAMESPACE = "mappers.LectureMapperxml";
//    @Autowired private SqlSession session;

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


}
