package mappers;

import domain.ReplyThread;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ReplyThMapper {

    String SELECTBYTNUMBER =
            "SELECT * FROM replythread WHERE tnumber = #{tnumber} ORDER BY replydate ASC";
    String REPLYTHINSERT =
            "INSERT INTO replythread(title, replydate, tnumber, rcontent, member) "+
                            " VALUES(#{title}, sysdate, #{tnumber}, #{rcontent}, #{member})";

    @Select(SELECTBYTNUMBER)
    List<ReplyThread> selectByTnumber(int tumber);

    @Insert(REPLYTHINSERT)
    int replyInsert(ReplyThread replyThread);
}
