package mappers;

import domain.Lecture;
import domain.Topics;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import pageutil.PaginationCriteria;

import java.util.Date;
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
    String SQL_SELECTPAGE = "select b.writer, b.title, b.topicdate, b.lecturekey, b.tcontent, b.tnumber, b.rlycount, b.lastrlyname, b.lastrlydate, b.views " +
            "from (select rownum rn, a.* from (select * from topics WHERE LECTUREKEY = #{lid} " +
            "order by topicdate desc) a) b " +
            "where rn between #{c.start} and #{c.end}";
    String SQL_SELECTTOPICBYTNUMBER =
            "SELECT * FROM topics WHERE tnumber = #{tnumber}";
    String SQL_UPDATELAST =
            "UPDATE lecture SET lastwriter = #{writer}, lasttitle = #{title}, lasttopicdate = sysdate, lasttnumber = #{tnumber} WHERE lid = #{lid}";
    String SQL_UPDATEVIEWS=
            "UPDATE topics SET views = views + 1 WHERE tnumber = #{tnumber}";
    String SQL_UPDATETOPIC =
            "UPDATE topics SET title = #{title}, tcontent = #{tcontent}, topicdate = sysdate WHERE tnumber = #{tnumber}";

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

    @Update(SQL_UPDATELAST)
    int updateLastJson(@Param("writer") String writer, @Param("tnumber") int tnumber,
                       @Param("title") String title, @Param("lid") String lid);
    @Update(SQL_UPDATEVIEWS)
    int updateViews(int tnumber);

    @Update(SQL_UPDATETOPIC)
    int updateTopic(Topics topics);
}
