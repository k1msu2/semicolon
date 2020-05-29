package kr.sc.ah;

import java.util.List;

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
}
