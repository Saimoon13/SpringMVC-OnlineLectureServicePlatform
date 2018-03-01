package mappers;

import domain.ReplyThread;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ReplyThMapper {

    String SELECTBYTNUMBER =
            "SELECT * FROM replythread WHERE tnumber = #{tnumber}";

    @Select(SELECTBYTNUMBER)
    List<ReplyThread> selectByTnumber(int tumber);

}
