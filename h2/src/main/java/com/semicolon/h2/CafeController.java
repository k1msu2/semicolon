package com.semicolon.h2;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.CafeDaoImpl;
import vo.CafeVo;
import vo.CircleVo;

@Controller
public class CafeController {
	@Autowired
	CafeDaoImpl dao;
	
	@RequestMapping("/cafe")
	public ModelAndView cafe(CafeVo vo) {
		ModelAndView mav = new ModelAndView();
		List<CafeVo> list = new ArrayList<>();
		list = dao.listAll();
		mav.addObject("cafeListAll", list);
		mav.setViewName("map");
		System.out.println(list);
		return mav;
	}
	
	@RequestMapping("/cafe/{gu}")
	public ModelAndView cafe(CafeVo vo, @PathVariable String gu) {
		System.out.println(gu);
		ModelAndView mav = new ModelAndView();
		List<CafeVo> list = new ArrayList<>();
		//list = dao.listGu(gu);
		list = dao.list500(gu);
		mav.addObject("cafeListAll", list);
		mav.setViewName("map");
		System.out.println(list);
		return mav;
	}
	
	// gu -> 0 : 강남  이렇게 숫자로 넘어오면 좋을 같다.. 지금은 문자열로 넘어옴.
	@RequestMapping("/cafe/500/{gu}")
	public ModelAndView cafe500(CircleVo vo, @PathVariable String gu) {
		System.out.println(gu);
		ModelAndView mav = new ModelAndView();
		List<CircleVo> list = new ArrayList<>();
		//list = dao.listGu(gu);
		list = dao.list500Circle(gu);
		mav.addObject("circleListAll", list);
		mav.setViewName("map");
		System.out.println(list);
		return mav;
	}
}
