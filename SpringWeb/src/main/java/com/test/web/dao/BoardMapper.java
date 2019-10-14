package com.test.web.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.test.web.vo.BoardVO;

public interface BoardMapper {
	public ArrayList<BoardVO> boardList(HashMap<String, String> map, RowBounds rb);
	public BoardVO boardRead(int boardNum);
	public int boardDelete(BoardVO vo);
	public void countHit(int boardNum);
	public int boardUpdate(BoardVO vo);
	public int boardWrite(BoardVO vo);
	public int getTotal(HashMap<String, String> map);
}
