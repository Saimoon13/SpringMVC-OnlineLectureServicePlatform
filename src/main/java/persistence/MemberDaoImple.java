package persistence;

import domain.Member;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberDaoImple implements MemberDao {
	private static final String NAMESPACE = "MemberMapper";

	private static final Logger logger = LoggerFactory.getLogger(MemberDaoImple.class);
	
	@Autowired private SqlSession session;
	
	@Override
	public List<Member> read() {
		return session.selectList(NAMESPACE + ".selectAllcate");
	}

	@Override
	public Member read(String userid) {
		return session.selectOne(NAMESPACE + ".selectById", userid);
	}

	@Override
	public int create(Member m) {
		System.out.println(m.getUserid());
		System.out.println(m.getEmail());
		System.out.println(m.getPassword());
		return session.insert(NAMESPACE + ".insert", m);
	}

	@Override
	public int update(Member m) {
		return session.update(NAMESPACE + ".update", m);
	}

	@Override
	public int delete(String userid) {
		return session.delete(NAMESPACE + ".delete", userid);
	}

	@Override
	public Member login(Member m) {
		return session.selectOne(NAMESPACE+".login_Member", m);
	}

	@Override
	public int addOnePostNum(String userid) {
		return session.update(NAMESPACE+".addOnePostNum", userid);
	}

	@Override
	public int totalMemberCount() {
		return session.selectOne(NAMESPACE+".totalMemberCount");
	}

	@Override
	public List<Member> newsetMember() {
		return session.selectList(NAMESPACE + ".newsetMember");
	}


} // end class MemberDaoImple
