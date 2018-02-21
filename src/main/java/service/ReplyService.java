package service;

import domain.Reply;

import java.util.List;

public interface ReplyService {
	
	List<Reply> select();
	List<Reply> select(int bno);
	int insert(Reply r);
	int update(Reply r);
	int delete(int rno);

}





