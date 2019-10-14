package global.sesoc.test.dao;
import global.sesoc.test.vo.Member;

public interface MemberMapper {
	// 로그인
	public Member selectOne(Member member);
}

