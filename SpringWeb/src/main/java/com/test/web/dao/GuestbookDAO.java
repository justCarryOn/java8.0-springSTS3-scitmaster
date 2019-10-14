package com.test.web.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.web.vo.GuestbookVO;

@Repository
public class GuestbookDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int delete(GuestbookVO vo) {
		GuestbookMapper mapper = sqlSession.getMapper(GuestbookMapper.class);
		return mapper.delete(vo);
	}
	
	public ArrayList<GuestbookVO> guestbookList(HashMap<String, String> map) {
		GuestbookMapper mapper = sqlSession.getMapper(GuestbookMapper.class);
		return mapper.guestbookList(map);
	}
	
	public int write(GuestbookVO vo) {
		GuestbookMapper mapper = sqlSession.getMapper(GuestbookMapper.class);
		return mapper.write(vo);
	}

	public GuestbookVO read(int seq) {
		GuestbookMapper mapper = sqlSession.getMapper(GuestbookMapper.class);
		return mapper.read(seq);
	}
}







