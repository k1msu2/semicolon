package com.semicolon.h2;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.CategoryDaoImpl;
import vo.CircleVo;

@Controller
public class CategoryController {

	@Autowired
	CategoryDaoImpl dao;

	@RequestMapping("/search/{gu}")
	public ModelAndView search(CircleVo vo, @PathVariable String gu) {
		System.out.println(gu);
		ModelAndView mav = new ModelAndView();
		List<CircleVo> list = new ArrayList<>();
		list = dao.list500(gu);
		mav.addObject("circleListAll", list);
		mav.setViewName("map");
		System.out.println(list);
		return mav;
	}

}
