package org.zerock.controller;



import java.text.SimpleDateFormat;
import java.util.Arrays;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.SampleDTO;
import org.zerock.domain.SampleDTOList;
import org.zerock.domain.TodoDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {
//	
//	@InitBinder
//	public void initBinder(WebDataBinder binder) {
//		SimpleDateFormat df = new SimpleDateFormat("yyyy-mm-dd");
//		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(df,false));
//		
//	}
	
	@GetMapping("/ex3")
	public void ex3(TodoDTO todo) {
		log.info(todo);
	}
	
	@GetMapping("/ex3A")
	public void ex3A(TodoDTO todo) {
		log.info(todo);
	}
	
	@GetMapping("/ex1")
	public void doA(SampleDTO dto) {
		log.info(dto);
	}
	
	@GetMapping("/ex2")
	public void ex2(@RequestParam("name") String name,@RequestParam("age") int age) {
		log.info(name);
		log.info(age);
		
	}
	
	@GetMapping("/ex2Arr")
	public void ex2(@RequestParam("id") String[] ids) {
		log.info(Arrays.toString(ids));
		
	}
	//@GetMapping("/exBean2")
	@RequestMapping(value = "/ex2Bean", method = {RequestMethod.GET,RequestMethod.POST})
	public void ex2Bean(SampleDTOList list) {
		log.info(list);
		
	}
}
