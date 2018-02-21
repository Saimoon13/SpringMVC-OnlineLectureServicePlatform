package persistence;

import domain.Reply;

import java.util.List;

public interface ReplyDao {
	
	List<Reply> read();
	List<Reply> read(int bno);
	int create(Reply r);
	int update(Reply r);
	int delete(int rno);
	Integer getBno(int rno);
	
} // end interface ReplyDao






