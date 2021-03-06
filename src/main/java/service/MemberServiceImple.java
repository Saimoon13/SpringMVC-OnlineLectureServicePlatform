package service;

import domain.Member;
import persistence.MemberDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImple implements MemberService {
	private static final Logger logger =
			LoggerFactory.getLogger(MemberServiceImple.class);
	
	@Autowired private MemberDao memberDao;
	
	@Override
	public List<Member> select() {
		return memberDao.read();
	}

	@Override
	public Member select(String userid) {
		return memberDao.read(userid);
	}

	@Override
	public int insert(Member m) {
		return memberDao.create(m);
	}

	@Override
	public int update(Member m) {
		return memberDao.update(m);
	}

	@Override
	public int delete(String userid) {
		return memberDao.delete(userid);
	}

	@Override
	public Member login(Member m) {
		return memberDao.login(m);
	}

	@Override
	public int addOnePostNum(String userid) {
		return memberDao.addOnePostNum(userid);
	}

	@Override
	public int memberTotalCount() {
		return memberDao.totalMemberCount();
	}

	@Override
	public List<Member> newsetMember() {
		return memberDao.newsetMember();
	}

} // end class MemberServiceImple
