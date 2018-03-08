package mappers;

import domain.ReplyThread;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface ReplyThMapper {

    String SELECT_BY_TNUMBER =
            "SELECT * FROM replythread WHERE tnumber = #{tnumber} ORDER BY replydate ASC";
    String REPLYTH_INSERT =
            "INSERT INTO replythread(title, replydate, tnumber, rcontent, member) "+
                            " VALUES(#{title}, sysdate, #{tnumber}, #{rcontent}, #{member})";
    String REPLY_UPDATE =
            "UPDATE replythread SET rcontent = #{rcontent} WHERE replynumber = #{replynumber}";
    String REPLY_COUNT =
            "UPDATE topics SET rlycount = rlycount + 1 WHERE tnumber = #{tnumber}";
    String REPLY_DELETE =
            "DELETE FROM replythread WHERE replynumber = #{replynumber}";
    String REPLY_COUNTOUT =
            "UPDATE topics SET rlycount = rlycount -1 WHERE tnumber = (SELECT tnumber FROM replythread WHERE replynumber = #{replynumber})";
    String SQL_UPDATE_LAST_RLY =
            "UPDATE topics SET lastrlyname = #{lastrlyname}, lastrlydate = sysdate WHERE tnumber = #{tnumber}";
    String SQL_UPDATE_RLYCOUNT =
            "UPDATE lecture SET rlycount  = rlycount + 1 WHERE lid = (SELECT lecturekey FROM topics WHERE tnumber = #{tnumber})";

    @Select(SELECT_BY_TNUMBER)
    List<ReplyThread> selectByTnumber(int tumber);

    @Insert(REPLYTH_INSERT)
    int replyInsert(ReplyThread replyThread);

    @Update(REPLY_UPDATE)
    int replyUpdate(ReplyThread replyThread);

    @Update(REPLY_COUNT)
    int replyCount(ReplyThread replyThread);

    @Delete(REPLY_DELETE)
    int replyDelete(int replynumber);

    @Update(REPLY_COUNTOUT)
    int replyCountOUT(int replynumber);

    @Update(SQL_UPDATE_LAST_RLY)
    int updateLastRly(@Param("lastrlyname") String lastrlyname, @Param("tnumber") long tnumber);

    @Update(SQL_UPDATE_RLYCOUNT)
    int updateRlyCount(long tnumber);

}
