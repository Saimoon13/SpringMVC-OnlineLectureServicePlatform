package service;

import domain.Member;

import java.util.List;

public interface MemberService {

	List<Member> select();
	Member select(String userid);
	int insert(Member m);
	int update(Member m);
	int delete(String userid);
	
} //end interface MemberService
