package org.zerock.mapper;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Autowired
	BoardMapper mapper;
	
	@Test
	public void testMap() {
		String type="TCW";
		String keyword ="홍길동";
		
		if(type == null||type.trim().length()==0) {
			//return null;
		}
		
		//T따로 C따로 W따로
		String[] arr = type.split("");
		
		log.info(Arrays.toString(arr));
		
		Map<String, String> map = new HashMap<>();
		for (String word : arr) {
			map.put(word, keyword);
		}
		log.info(map);
	}
	
	@Test
	public void testSearch() {
		Map<String, String> map = new HashMap<>();
		map.put("T","샘플");
		map.put("C","샘플");
		map.put("W","샘플");
		mapper.search(map);
	}
	
	@Test
	public void testpageMaker() {
		Criteria cri = new Criteria();
		cri.setPage(11);
		PageMaker pm = new PageMaker(cri,201);
		
		log.info(pm);
		log.info("----------------");
		log.info(pm.getLink("/board/list", 3));
	}
	
	
	@Test
	public void testPaging2() {
		
		//1page,10
		Criteria cri = new Criteria();
		cri.setAmount(50);
		cri.setType("TCW");
		cri.setKeyword("user00");
		
		mapper.selectPage(cri).forEach(vo -> log.info(vo));
	}
	
	
	@Test
	public void testPaging() {
		
		//1page,10
		Criteria cri = new Criteria();
		cri.setAmount(50);
		cri.setType("TCW");
		cri.setKeyword("user00");
		
		mapper.selectPage(cri).forEach(vo -> log.info(vo));
	}
	
	@Test
	public void testDelete() {
		int count =  mapper.delete(5);
		
		log.info("delete count: "+count);
	}
	
	@Test
	public void testUpdate() {
		BoardVO vo = mapper.select(4);
		vo.setTitle("수정~~~");
		vo.setContent("바꿈바꿉");
		int count = mapper.update(vo);
		
		log.info("update count :"+ count);
	}
	
	@Test
	public void testSelect() {
		BoardVO vo = mapper.select(1);
		log.info(vo);
	}
	
	@Test
	public void testinsert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("샘플제목");
		vo.setContent("내용");
		vo.setWriter("user01");;
		mapper.insert(vo);
	}
	
}
