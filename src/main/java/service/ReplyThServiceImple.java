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

    @Override
    public int replyUpdate(ReplyThread replyThread) {
        return replyThDao.replyUpdate(replyThread);
    }

    @Override
    public int replyCount(ReplyThread replyThread) {
        return replyThDao.replyCount(replyThread);
    }

    @Override
    public int replyDelete(int replynumber) {
        return replyThDao.replyDelete(replynumber);
    }

    @Override
    public int updateLastRly(String lastrlyname, long tnumber) {
        return replyThDao.updateLastRly(lastrlyname, tnumber);
    }

    @Override
    public int updateRlyCount(long tnumber) {
        return replyThDao.updateRlyCount(tnumber);
    }

    @Override
    public int replyThreadTotalCount() {
        return replyThDao.replyThreadTotalCount();
    }

    @Override
    public int replyCountOUT(int replynumber) {
        return replyThDao.replyCountOUT(replynumber);
    }


}
