package persistence;

import domain.Member;

import java.util.List;

public interface MemberDao {

	List<Member> read();
	Member read(String userid);
	int create(Member m);
	int update(Member m);
	int delete(String userid);
	
} // end interface MemberDao
