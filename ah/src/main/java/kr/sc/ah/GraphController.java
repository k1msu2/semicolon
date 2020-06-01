package kr.sc.ah;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.GraphDaoImpl;
import vo.AptGraphDataVo;
import vo.AptGraphDongVo;
import vo.AptGraphGuVo;
import vo.AptGraphSearchVo;

@Controller
public class GraphController {
	@Autowired
	GraphDaoImpl dao;

	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/graph1/{aptname}")
	public String graph1(@PathVariable String aptname) throws Exception {
		System.out.println(aptname);
		List<AptGraphDataVo> list = dao.listGraphData(aptname);
		JSONArray jsonArray = new JSONArray();
		for(int i = 0; i < list.size(); i++) {
			JSONObject json = new JSONObject();		
			json.put("date",list.get(i).getDate());
			json.put(list.get(i).getYname(), Double.toString(list.get(i).getY()));
			json.put(list.get(i).getValname(), Integer.toString(list.get(i).getValue()));
			jsonArray.add(json);
		}		
		System.out.println(new ObjectMapper().writeValueAsString(jsonArray));
		return new ObjectMapper().writeValueAsString(jsonArray);
	}
	@ResponseBody
	@RequestMapping(value = "/graph1/df/{aptname}",produces="applicaiton/json; charset=UTF-8")
	public String graph1df(@PathVariable String aptname) throws Exception {
		System.out.println(new ObjectMapper().writeValueAsString(dao.listGraphDF(aptname)));
		return new ObjectMapper().writeValueAsString(dao.listGraphDF(aptname));
	}
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/graph2/{gu}",produces="applicaiton/json; charset=UTF-8")
	public String graph2(@PathVariable String gu) throws Exception {
		System.out.println(gu);
		
		Map<Integer,JSONArray> jsonArrayMap = new HashMap<Integer,JSONArray>();
		for(int year = 2010; year <= 2020; year++) {
			JSONArray jsonArray = new JSONArray();
			
			AptGraphSearchVo vo = new AptGraphSearchVo();
			vo.setDealyear(Integer.toString(year));
			vo.setGu(gu);
			System.out.println(vo);
			
			List<AptGraphGuVo> gudatalist =  dao.listGraphGuData(vo);
			for(int i = 0; i < gudatalist.size(); i++) {
				JSONObject json = new JSONObject();		
				json.put("dong",gudatalist.get(i).getDong());
				json.put("perprice",gudatalist.get(i).getPerprice());
				jsonArray.add(json);
			}		
			jsonArrayMap.put(year, jsonArray);
		}
		
		System.out.println(new ObjectMapper().writeValueAsString(jsonArrayMap));
		return new ObjectMapper().writeValueAsString(jsonArrayMap);
	}
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/graph2/{gu}/{dong}",produces="applicaiton/json; charset=UTF-8")
	public String graph2(@PathVariable String gu, @PathVariable String dong) throws Exception {
		System.out.println(gu);
		
		Map<Integer,JSONArray> jsonArrayMap = new HashMap<Integer,JSONArray>();
		for(int year = 2010; year <= 2020; year++) {
			JSONArray jsonArray = new JSONArray();
			
			AptGraphSearchVo vo = new AptGraphSearchVo();
			vo.setDealyear(Integer.toString(year));
			vo.setDong(dong);
			vo.setGu(gu);
			
			List<AptGraphDongVo> dongdatalist =  dao.listGraphDongData(vo);
			for(int i = 0; i < dongdatalist.size(); i++) {
				JSONObject json = new JSONObject();		
				json.put("aptname",dongdatalist.get(i).getAptname());
				json.put("perprice",dongdatalist.get(i).getPerprice());
				jsonArray.add(json);
			}		
			jsonArrayMap.put(year, jsonArray);
		}
		
		System.out.println(new ObjectMapper().writeValueAsString(jsonArrayMap));
		return new ObjectMapper().writeValueAsString(jsonArrayMap);
	}


}
