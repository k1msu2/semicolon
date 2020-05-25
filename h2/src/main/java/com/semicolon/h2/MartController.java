package com.semicolon.h2;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MartDaoImpl;
import vo.MartVo;


@Controller
public class MartController {
	
	@Autowired
	MartDaoImpl dao;
	
	@RequestMapping("/mart")
	public ModelAndView info(MartVo vo) {
		ModelAndView mav = new ModelAndView();
		List<MartVo> list = new ArrayList<>();
		list = dao.listAll();
		mav.addObject("martListAll", list);
		mav.setViewName("map");
		System.out.println(list);
		return mav;
	}

}
