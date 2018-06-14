package org.zerock.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.UploadDTO;
import org.zerock.domain.UploadVO;

public interface UploadService {
	
	
	public int delete(String uuid);
	
	public int insert(UploadVO vo);
	
	public UploadDTO pageList(Criteria cri);

}
