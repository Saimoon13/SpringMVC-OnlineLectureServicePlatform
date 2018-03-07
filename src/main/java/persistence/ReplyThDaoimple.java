package persistence;

import domain.ReplyThread;
import mappers.ReplyThMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReplyThDaoimple implements ReplyThDao {

    @Autowired private ReplyThMapper mapper;

    @Override
    public List<ReplyThread> selectByTnumber(int tnumber) {
        return mapper.selectByTnumber(tnumber);
    }

    @Override
    public int replyInsert(ReplyThread replyThread) {
        return mapper.replyInsert(replyThread);
    }

    @Override
    public int replyUpdate(ReplyThread replyThread) {
        return mapper.replyUpdate(replyThread);
    }

    @Override
    public int replyCount(ReplyThread replyThread) {
        return mapper.replyCount(replyThread);
    }

    @Override
    public int replyCountOUT(int replynumber) {
        return mapper.replyCountOUT(replynumber);
    }

    @Override
    public int replyDelete(int replynumber) {
        return mapper.replyDelete(replynumber);
    }

    @Override
    public int updateLastRly(String lastrlyname, long tnumber) {
        return mapper.updateLastRly(lastrlyname, tnumber);
    }

}
