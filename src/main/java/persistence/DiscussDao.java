package persistence;

import domain.Lecture;
import domain.Topics;
import org.apache.ibatis.annotations.Param;
import pageutil.PaginationCriteria;

import java.util.Date;
import java.util.List;

public interface DiscussDao {

    List<Lecture> selectAllcate(); // 모든 카테고리
    List<Topics> selectTopicsByLid(String lid);
    int insert(Topics topics);
    int getCountByLid(String lid);
    List<Topics> selectPage(String lid, PaginationCriteria c);
    Topics selectTopicByTnumber(int tnumber);
    int updateLast(String writer, int tnumber, String title, String ld);
    int updateViews(int tnumber);
    int updateTopic(Topics topics);
    int deleteTopic(int tnumber);
    int searchCountTopicsByLid(String searchType, String searchKeyword, String lid);
    int updateTopicCount(String lid);
    int selectLastTnumber(String writer, Date topicdate);

}
