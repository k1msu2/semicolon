package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.AptGraphDFVo;
import vo.AptGraphDataVo;
import vo.AptGraphDongVo;
import vo.AptGraphGuVo;
import vo.AptGraphSearchVo;

@Repository
public class GraphDaoImpl implements GraphDao{
	@Autowired
	SqlSession session;
	
	@Override
	public List<AptGraphDataVo> listGraphData(String aptname){
		String statement="resource.AptGraphMapper.selectGraphData";
		List<AptGraphDataVo> list = session.selectList(statement,aptname);
		return list;
	}
	
	@Override
	public List<AptGraphDFVo> listGraphDF(String aptname){
		System.out.println("test111");
		String statement="resource.AptGraphMapper.selectGraphDataField";
		List<AptGraphDFVo> list = session.selectList(statement,aptname);
		return list;
	}
	
	@Override
	public List<AptGraphGuVo> listGraphGuData(AptGraphSearchVo vo) {
		String statement="resource.AptGraphMapper.selectGraphGuData";
		List<AptGraphGuVo> list = session.selectList(statement,vo);
		System.out.println(list);
		return list;
		
	}

	public List<AptGraphDongVo> listGraphDongData(AptGraphSearchVo vo) {
		String statement="resource.AptGraphMapper.selectGraphDongData";
		List<AptGraphDongVo> list = session.selectList(statement,vo);
		System.out.println(list);
		return list;
	}
	
}
