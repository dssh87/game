package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardService {
	
	public List<BoardVO> list(Criteria cri);

	public int getTotal(Criteria cri);
	
	public int register(BoardVO vo);

	public BoardVO read(int bno);
	
	public int remove(int bno);

	public int modify(BoardVO vo);
	
	public int updateReplyCnt(Integer bno, int amount);
	
	

}
