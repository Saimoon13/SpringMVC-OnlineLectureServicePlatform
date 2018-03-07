package service;

import domain.Lecture;
import domain.Topics;
import pageutil.PaginationCriteria;

import java.util.Date;
import java.util.List;

public interface DiscussService {

    List<Lecture> selectAll();
    List<Topics> selectTopicsByLid(String lid);
    int insertTopic(Topics topics);
    int getCountByLid(String lid);
    List<Topics> selectPage(String lid, PaginationCriteria c);
    Topics selectTopicByTnumber(int tnumber);
    int updateLast(String writer, int tnumber, String title, String lid);
    int updateViews(int tnumber);
    int updateTopic(Topics topics);
    int deleteTopic(int tnumber);
    List<Topics> searchTopicsByLid(int searchType, String searchKeyword, String lid);
    int searchCountTopicsByLid(String searchType, String searchKeyword, String lid);
}
