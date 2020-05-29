package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.AptGraphDataVo;

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
	
	
}
