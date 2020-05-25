package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CafeVo;
import vo.CircleVo;

@Repository
public class CategoryDaoImpl implements CategoryDao<List<CircleVo>,String, List<CircleVo>>{

	@Autowired
	SqlSession session = null;

	@Override
	public List<CircleVo> list500(String gu) {
		String statement = "";
		List<CircleVo> list = null;
		statement = "resource.CafeMapper.selectCafeIn500";
		list = session.selectList(statement, gu);
		return list;
	}

	@Override
	public List<CircleVo> listAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CircleVo> listGu(String t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CircleVo> list500Circle(String t) {
		// TODO Auto-generated method stub
		return null;
	}


}
