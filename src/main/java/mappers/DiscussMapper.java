package mappers;

import domain.Lecture;
import domain.Topics;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import pageutil.PaginationCriteria;

import java.util.List;

public interface DiscussMapper {

    String SQL_GETALLCATE =
            "SELECT * FROM LECTURE";
    String SQL_GETALLTOPIC =
            "SELECT * FROM TOPICS WHERE LECTUREKEY = #{lid}";
    String SQL_INSERTTOPIC =
            "INSERT INTO TOPICS(writer, title, topicdate, lecturekey, tcontent) " +
                    "VALUES (#{writer}, #{title}, sysdate, #{lecturekey}, #{tcontent})";
    String SQL_GETTOTALCOUNT =
            "SELECT count(*) cnt from topics where Lecturekey = #{lid}";
    String SQL_SELECTPAGE = "select b.writer, b.title, b.topicdate, b.lecturekey, b.tcontent, b.tnumber " +
            "from (select rownum rn, a.* from (select * from topics WHERE LECTUREKEY = #{lid} " +
            "order by topicdate desc) a) b " +
            "where rn between #{c.start} and #{c.end}";
    String SQL_SELECTTOPICBYTNUMBER =
            "SELECT * FROM topics WHERE tnumber = #{tnumber}";
    String SQL_UPDATELASJSON =
            "update lecture set lastjson = #{lastjson} where lid = #{lid}";

    @Select(SQL_GETALLCATE)
    List<Lecture> selectAllcate();

    @Select(SQL_GETALLTOPIC)
    List<Topics> selectTopicsByLid(String lid);

    @Insert(SQL_INSERTTOPIC)
    int insertTopic(Topics topics);

    @Select(SQL_GETTOTALCOUNT)
    int getCountByLid(String lid);

    @Select(SQL_SELECTPAGE)
    List<Topics> selectPage(@Param("lid") String lid, @Param("c") PaginationCriteria c);

    @Select(SQL_SELECTTOPICBYTNUMBER)
    Topics selectTopicByTnumber(int tnumber);

    @Update(SQL_UPDATELASJSON)
    int updateLastJson(@Param("lastjson")String lastjson, @Param("lid") String lid);
}
