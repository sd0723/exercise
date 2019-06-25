package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Integer bno, RedirectAttributes rttr) {
		log.info("bno: "+bno);
		int count = service.remove(bno);
		
		rttr.addFlashAttribute("result","success");
		return "redirect:/board/list";
	}
	
	@GetMapping({"/read","/modify"})
	public void read(@RequestParam("bno") Integer bno, Model model) {
		log.info("bno : "+bno);
		model.addAttribute("vo",service.get(bno));
	}
	
	@GetMapping("/list")
	public void listAll(Model model) {
		
		model.addAttribute("list",service.listAll());
		
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO vo, RedirectAttributes rttr) {
		service.modify(vo);
		rttr.addFlashAttribute("result","success");
		return "redirect:/board/list";
	}
	
	@GetMapping("/register")
	public void register() {
		
		log.info("get register............................");
		
	}
	
	@PostMapping("/register")
	public String register(BoardVO vo,RedirectAttributes rttr) {
		log.info("vo :"+vo);
		service.register(vo);
		rttr.addFlashAttribute("result","success");
		return "redirect:/board/list";
	}
	
}
