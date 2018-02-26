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
		logger.info("select() 호출");
		return memberDao.read();
	}

	@Override
	public Member select(String userid) {
		logger.info("select(userid: {}) 호출", userid);
		return memberDao.read(userid);
	}

	@Override
	public int insert(Member m) {
		logger.info("insert() 호출");
		return memberDao.create(m);
	}

	@Override
	public int update(Member m) {
		logger.info("update() 호출");
		return memberDao.update(m);
	}

	@Override
	public int delete(String userid) {
		logger.info("delete() 호출");
		return memberDao.delete(userid);
	}

	@Override
	public Member login(Member m) {

		return memberDao.login(m);
	}

} // end class MemberServiceImple
