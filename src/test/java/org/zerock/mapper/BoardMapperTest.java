package org.zerock.mapper;

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
public class BoardMapperTest {
	
	@Setter(onMethod_= {@Autowired})
	private BoardMapper mapper;
	
	@Test
	public void updateReplyCntTest() {
		
		
		log.info(mapper.updateReplyCnt(2, 2));
		
		}
	
	@Test
	public void getList() {
		Criteria cri = new Criteria(1);
		log.info(mapper.list(cri));
	}

	@Test
	public void getTotal() {
		Criteria cri = new Criteria();
		log.info(mapper.getTotal(cri));
	}
	
	@Test
	public void getSearch() {
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setType("tc");
		cri.setKeyword("테스트");
		log.info(mapper.list(cri));
	}
	
	@Test
	public void register() {
		BoardVO vo = new BoardVO();
		vo.setTitle("코드로 배우는 스프링 웹 프로젝트");
		vo.setContent("현재까지 출간된 스프링관련 많은 서적들은 주로 스프링의 내부 구조나 원리 등 이론적인 배경에 초점을 두었지만, 이 책은 실제 개발 현장에서 사용하는 도구로서 스프링을 취급합니다.");
		vo.setWriter("칙촉");
		log.info(vo);
		mapper.register(vo);
	}
	@Test
	public void getRead() {
		log.info(mapper.read(3));
	}
	
	@Test
	public void remove() {
		int bno = 1507385;
		log.info(mapper.remove(bno));
	}
	
}
