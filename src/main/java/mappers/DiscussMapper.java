package mappers;

import domain.Discuss;
import domain.Topics;
import org.apache.ibatis.annotations.*;
import pageutil.PaginationCriteria;

import java.util.Date;
import java.util.List;

public interface DiscussMapper {

    String SQL_GETALLCATE =
            "SELECT * FROM Discuss";
    String SQL_GETALLTOPIC =
            "SELECT * FROM TOPICS WHERE LECTUREKEY = #{lid}";
    String SQL_INSERTTOPIC =
            "INSERT INTO TOPICS(writer, title, topicdate, lecturekey, tcontent) " +
                    "VALUES (#{writer}, #{title}, sysdate, #{lecturekey}, #{tcontent})";
    String SQL_GETTOTALCOUNT =
            "SELECT count(*) cnt FROM topics WHERE Lecturekey = #{lid}";
    String SQL_SELECTPAGE =
            "select b.writer, b.title, b.topicdate, b.lecturekey, b.tcontent, b.tnumber, b.rlycount, b.lastrlyname, b.lastrlydate, b.views " +
            "from (select rownum rn, a.* from (select * from topics WHERE LECTUREKEY = #{lid} " +
            "order by topicdate desc) a) b " +
            "where rn between #{c.start} and #{c.end}";
    String SQL_SELECTTOPICBYTNUMBER =
            "SELECT * FROM topics WHERE tnumber = #{tnumber}";
    String SQL_UPDATELAST =
            "UPDATE Discuss SET lastwriter = #{writer}, lasttitle = #{title}, lasttopicdate = sysdate, lasttnumber = #{tnumber} WHERE lid = #{lid}";
    String SQL_UPDATEVIEWS=
            "UPDATE topics SET views = views + 1 WHERE tnumber = #{tnumber}";
    String SQL_UPDATETOPIC =
            "UPDATE topics SET title = #{title}, tcontent = #{tcontent}, topicdate = sysdate WHERE tnumber = #{tnumber}";
    String SQL_DELETETOPIC =
            "DELETE FROM topics WHERE tnumber = #{tnumber}";
    String SQL_SEARCH_COUNT_TOPIC_BY_LID =
            "<script> SELECT count(*) cnt FROM topics WHERE " +
            "<if test='searchType == \"title\"'> " + "title LIKE #{searchKeyword} " +  "</if>" +
            "<if test='searchType == \"content\"'> " + "tcontent LIKE #{searchKeyword} " +  "</if>" +
            "<if test='searchType == \"username\"'> " + "writer LIKE #{searchKeyword} " +  "</if>" +
            "and lecturekey = #{lid} </script>";
    String SQL_UPDATE_TOPICCOUNT =
            "UPDATE Discuss SET topiccount = topiccount + 1 WHERE lid = #{lid}";
    String SQL_SELECT_LAST_TNUMBER =
            "SELECT tnumber FROM topics WHERE writer = #{writer} and topicdate = #{topicdate}";

    @Select(SQL_GETALLCATE)
    List<Discuss> selectAllcate();

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

    @Delete(SQL_DELETETOPIC)
    int deleteTopic(int tnumber);

    @Select(SQL_SEARCH_COUNT_TOPIC_BY_LID)
    int searchCountTopicsByLid(@Param("searchType") String searchType,
                               @Param("searchKeyword") String searchKeyword,
                               @Param("lid") String lid);
    @Update(SQL_UPDATE_TOPICCOUNT)
    int updateTopicCount(String lid);

    @Select(SQL_SELECT_LAST_TNUMBER)
    int selectLastTnumber(@Param("writer") String writer,@Param("topicdate") Date topicdate);
}
