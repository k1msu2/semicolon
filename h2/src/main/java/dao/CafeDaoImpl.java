package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CafeVo;
import vo.CircleVo;

@Repository
public class CafeDaoImpl implements CategoryDao<List<CafeVo>,String, List<CircleVo>>{

	@Autowired
	SqlSession session = null;
	
	@Override
	public List<CafeVo> listAll() {
		String statement = "resource.CafeMapper.selectCafeinfo";
		List<CafeVo> list = session.selectList(statement);
		System.out.println("-------DAO------");
		System.out.println(list);
		System.out.println("----------------");
		return list;
	}

	@Override
	public List<CafeVo> listGu(String gu) {
		String statement = "";
		List<CafeVo> list = null;
		statement = "resource.CafeMapper.selectCafeGuLoc";
		list = session.selectList(statement, gu);
		return list;
	}
	@Override
	public List<CafeVo> list500(String gu) {
		String statement = "";
		List<CafeVo> list = null;
		statement = "resource.CafeMapper.selectCafeIn500";
		list = session.selectList(statement, gu);
		return list;
	}

	@Override
	public List<CircleVo> list500Circle(String gu) {
		String statement = "";
		List<CircleVo> list = null;
		statement = "resource.CafeMapper.selectCafeIn500";
		list = session.selectList(statement, gu);
		return list;
	}

}
