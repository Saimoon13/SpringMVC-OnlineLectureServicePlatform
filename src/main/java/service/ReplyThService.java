package service;

import domain.ReplyThread;

import java.util.List;

public interface ReplyThService {

    List<ReplyThread> selectByTnumber(int tnumber);
    int replyInsert(ReplyThread replyThread);
    int replyUpdate(ReplyThread replyThread);
    int replyCount(ReplyThread replyThread);
    int replyCountOUT(int replynumber);
    int replyDelete(int replynumber);
    int updateLastRly(String lastrlyname, long tnumber);
    int updateRlyCount(long tnumber);
    int replyThreadTotalCount();
}
