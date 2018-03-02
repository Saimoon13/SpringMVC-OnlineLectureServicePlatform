package service;

import domain.ReplyThread;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import persistence.ReplyThDao;

import java.util.List;

@Repository
public class ReplyThServiceImple implements ReplyThService {

    @Autowired private ReplyThDao replyThDao;

    @Override
    public List<ReplyThread> selectByTnumber(int tnumber) {
        return replyThDao.selectByTnumber(tnumber);
    }

    @Override
    public int replyInsert(ReplyThread replyThread) {
        return replyThDao.replyInsert(replyThread);
    }
}
