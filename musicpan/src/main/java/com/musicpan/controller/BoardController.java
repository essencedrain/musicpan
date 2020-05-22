package com.musicpan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.musicpan.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/")
@AllArgsConstructor
public class BoardController {
		
		
		private BoardService service;
		
		@GetMapping("/list/{b_name}")
		public String list(@PathVariable("b_name") String b_name, Model model) {
		
			log.info("list");
			model.addAttribute("b_name", b_name);
			model.addAttribute("list", service.getList(b_name));
			
			return "board/list";
		}
		
}//class
