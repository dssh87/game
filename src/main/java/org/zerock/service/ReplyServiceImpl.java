package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyDTO;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ReplyMapper;

import lombok.Setter;
@Service
public class ReplyServiceImpl implements ReplyService {

	
	@Setter(onMethod_= {@Autowired})
	private ReplyMapper replyMapper;
	

	@Setter(onMethod_= {@Autowired})
	private BoardMapper boardMapper;
	
	@Transactional
	@Override
	public int create(ReplyVO vo) {
		
		boardMapper.updateReplyCnt(vo.getBno(), 1);
		
		return replyMapper.create(vo);
	}

	@Override
	public ReplyVO read(Integer rno) {
		
		return replyMapper.read(rno);
	}

	@Override
	public int update(ReplyVO vo) {
		
		return replyMapper.update(vo);
	}

	@Transactional
	@Override
	public int delete(Integer rno) {
		int bno = replyMapper.getBno(rno);
		boardMapper.updateReplyCnt(bno, -1);
		
		return replyMapper.delete(rno);
	}

	@Override
	public ReplyDTO list(Criteria cri, Integer bno) {
		
		ReplyDTO dto = new ReplyDTO();
		dto.setList(replyMapper.list(cri, bno));
		dto.setReplyCnt(replyMapper.getTotal(bno));
		
		return dto;
	}

}
