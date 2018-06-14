package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.UploadVO;
import org.zerock.service.UploadService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UploadMapperTests {
	
	@Setter(onMethod_={@Autowired})	
	private UploadMapper mapper;
	
	@Setter(onMethod_={@Autowired})	
	private UploadService service;
	
	@Test
	public void deleteTest() {
		service.delete("01571406-282e-4c1e-9010-b2181f6b38a2_Penguins.jpg");
	}
	
	@Test
	public void testInsert() {
		
		UploadVO upload = new UploadVO();
		upload.setFileName("นูป็");

		mapper.insert(upload);
		
	}
	
	@Test
	public void getListTest() {
		
		Criteria cri = new Criteria(2);
		log.info(mapper.getList(cri));
		
	}
	
	@Test
	public void getTotalTest() {
		
		log.info(mapper.getTotal());
	}

}
