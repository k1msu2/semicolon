package com.semicolon.h2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.CenterDaoImpl;
import vo.AptVo;
import vo.CenterVo;

@Controller
public class ViewController {
	
	@Autowired
	CenterDaoImpl dao;
	
	@RequestMapping("/gu2/{gu}")
	public ModelAndView view(@PathVariable String gu) {
		System.out.println(gu);
		ModelAndView mav = new ModelAndView();
		CenterVo vo = dao.CenterAll(gu);
		mav.addObject("centerVo", vo);
		mav.setViewName("map2");
		System.out.println(vo);
		return mav;
	}
	

	// ajax 로 좌표 전송
	@ResponseBody
	@RequestMapping(value="/gu/{gu}",produces="applicaiton/json; charset=UTF-8")
	public String aptgu2(AptVo vo, @PathVariable String gu) throws Exception{
		System.out.println(gu);
		System.out.println(new ObjectMapper().writeValueAsString(dao.CenterAll(gu)));
		return new ObjectMapper().writeValueAsString(dao.CenterAll(gu));
	}
}
