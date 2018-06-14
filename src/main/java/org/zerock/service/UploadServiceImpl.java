package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.UploadDTO;
import org.zerock.domain.UploadVO;
import org.zerock.mapper.UploadMapper;

import lombok.Setter;

@Service
public class UploadServiceImpl implements UploadService {

	@Setter(onMethod_= {@Autowired})
	private UploadMapper mapper;
	
	

	@Override
	public int delete(String uuid) {
		
		return mapper.delete(uuid);
	}

	@Override
	public int insert(UploadVO vo) {

		return mapper.insert(vo);
	}

	

	@Override
	public UploadDTO pageList(Criteria cri) {
		UploadDTO dto = new UploadDTO();
		dto.setList(mapper.getList(cri));
		dto.setUploadCnt(mapper.getTotal());
		
		return dto;
	}

}
