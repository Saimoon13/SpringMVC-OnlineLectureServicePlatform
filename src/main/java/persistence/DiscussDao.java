package persistence;

import domain.Lecture;
import domain.Topics;
import org.apache.ibatis.annotations.Param;
import pageutil.PaginationCriteria;

import java.util.List;

public interface DiscussDao {

    List<Lecture> selectAllcate(); // 모든 카테고리
    List<Topics> selectTopicsByLid(String lid);
    int insert(Topics topics);
    int getCountByLid(String lid);
    List<Topics> selectPage(String lid, PaginationCriteria c);
    Topics selectTopicByTnumber(int tnumber);

}
