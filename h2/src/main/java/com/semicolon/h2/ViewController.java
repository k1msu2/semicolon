package com.semicolon.h2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.ViewDaoImpl;
import vo.AptVo;
import vo.CenterVo;
import vo.OptionVo;

@Controller
public class ViewController {
	
	@Autowired
	ViewDaoImpl dao;
	
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
	
	
	// ajax 로  지역구 리스트 전송
	@ResponseBody
	@RequestMapping(value="/gu",produces="applicaiton/json; charset=UTF-8")
	public String gulist() throws Exception{
		System.out.println(new ObjectMapper().writeValueAsString(dao.guListAll()));
		return new ObjectMapper().writeValueAsString(dao.guListAll());
	}
	

	// ajax 로 지역구 내 동 전송
	@ResponseBody
	@RequestMapping(value="/gu/{gu}",produces="applicaiton/json; charset=UTF-8")
	public String gugu(@PathVariable String gu) throws Exception{
		System.out.println(new ObjectMapper().writeValueAsString(dao.dongListAll(gu)));
		return new ObjectMapper().writeValueAsString(dao.dongListAll(gu));
	}
	
	
	// ajax 로 지역구 내 동 전송
	@ResponseBody
	@RequestMapping(value="/cat1",produces="applicaiton/json; charset=UTF-8")
	public String cat1() throws Exception{
		System.out.println(new ObjectMapper().writeValueAsString(dao.catListAll()));
		return new ObjectMapper().writeValueAsString(dao.catListAll());
	}
	
	// ajax 로 지역구 내 동 전송
	@ResponseBody
	@RequestMapping(value="/cat2",produces="applicaiton/json; charset=UTF-8")
	public String cat2() throws Exception{
		System.out.println(new ObjectMapper().writeValueAsString(dao.catListAll()));
		return new ObjectMapper().writeValueAsString(dao.catListAll());
	}
	
	// ajax 로 지역구 내 동 전송
	@ResponseBody
	@RequestMapping(value="/cat3",produces="applicaiton/json; charset=UTF-8")
	public String cat3() throws Exception{
		System.out.println(new ObjectMapper().writeValueAsString(dao.catListAll()));
		return new ObjectMapper().writeValueAsString(dao.catListAll());
	}
	
	// ajax 로 지역구 내 동 전송
	@ResponseBody
	@RequestMapping(value="/cat1/{catname}",produces="applicaiton/json; charset=UTF-8")
	public String cat1one() throws Exception{
		System.out.println(new ObjectMapper().writeValueAsString(dao.catListAll()));
		return new ObjectMapper().writeValueAsString(dao.catListAll());
	}
	
	// ajax 로 지역구 내 동 전송
	@ResponseBody
	@RequestMapping(value="/cat2/{catname}",produces="applicaiton/json; charset=UTF-8")
	public String cat2one() throws Exception{
		System.out.println(new ObjectMapper().writeValueAsString(dao.catListAll()));
		return new ObjectMapper().writeValueAsString(dao.catListAll());
	}
	
	// ajax 로 지역구 내 동 전송
	@ResponseBody
	@RequestMapping(value="/cat3/{catname}",produces="applicaiton/json; charset=UTF-8")
	public String cat3one() throws Exception{
		System.out.println(new ObjectMapper().writeValueAsString(dao.catListAll()));
		return new ObjectMapper().writeValueAsString(dao.catListAll());
	}
	
	// ajax 로 지역구 내 동 전송
	@ResponseBody
	@RequestMapping(value="/cat123",produces="applicaiton/json; charset=UTF-8")
	public String cat123(String gu) throws Exception{
		gu ="강남구";
		System.out.println(new ObjectMapper().writeValueAsString(dao.list500(gu)));
		return new ObjectMapper().writeValueAsString(dao.list500(gu));
	}
	
	@ResponseBody
	@RequestMapping(value="/cat123option",produces="applicaiton/json; charset=UTF-8")
	public String cat123vo(OptionVo vo) throws Exception{
		System.out.println(new ObjectMapper().writeValueAsString(dao.listOption(vo)));
		return new ObjectMapper().writeValueAsString(dao.listOption(vo));
	}
	
}
