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
        System.out.println(replyThread.getTnumber()+"다오");
        return mapper.replyInsert(replyThread);
    }
}
