package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.UploadVO;

public interface UploadMapper {
	
	public List<UploadVO> getList(Criteria cri);
	
	public int delete(String uuid);
	
	public int insert(UploadVO vo);
	
	public int getTotal();
}
