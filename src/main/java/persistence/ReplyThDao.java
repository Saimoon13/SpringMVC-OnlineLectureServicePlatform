package persistence;

import domain.ReplyThread;

import java.util.List;

public interface ReplyThDao {

    List<ReplyThread> selectByTnumber(int tnumber);
    int replyInsert(ReplyThread replyThread);
}
