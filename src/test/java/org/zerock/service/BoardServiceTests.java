package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
	
	@Setter(onMethod_= {@Autowired})
	private BoardService service;
	
	
	@Test
	public void getList() {
		Criteria cri = new Criteria(3);
		log.info(service.list(cri));
	}
	
	@Test
	public void register() {
		BoardVO vo = new BoardVO();
		vo.setTitle("AOP");
		vo.setContent("사전적 의미로는 '측면' 혹은 어떤 도형의 '면'을 의미하지만 실제 개발에서 의미하는 것은 '비지니스 로직은 아니지만 반드시 해야하는 작업' 정도로 해석할 수 있다 ");
		vo.setWriter("콜드브루");
		log.info(vo);
		service.register(vo);
		
	}
	
	@Test
	public void remove() {
		int bno = 1507384;
		
		service.remove(bno);
	}

}
