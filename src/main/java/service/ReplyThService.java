package service;

import domain.ReplyThread;

import java.util.List;

public interface ReplyThService {

    List<ReplyThread> selectByTnumber(int tnumber);
    int replyInsert(ReplyThread replyThread);
}
