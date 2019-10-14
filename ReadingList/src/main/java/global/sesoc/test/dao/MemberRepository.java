package global.sesoc.test.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.test.vo.Member;

/**
 * 회원 관련 DAO
 */
@Repository
public class MemberRepository {

	@Autowired
	SqlSession session;

	/**
	 * ID로 회원정보 검색
	 * @param id 검색할 아이디
	 * @return 검색된 회원정보. 없으면 null.
	 */
	public Member selectOne(Member member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		Member m = mapper.selectOne(member);
		return m;
	}
}

