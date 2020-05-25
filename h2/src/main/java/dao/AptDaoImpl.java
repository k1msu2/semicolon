package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.AptDetailVo;
import vo.AptVo;
import vo.CafeVo;
import vo.CircleVo;

@Repository
public class AptDaoImpl implements CategoryDao<List<AptVo>,String,List<CircleVo>>{

	@Autowired
	SqlSession session = null;
	
	@Override
	public List<AptVo> listAll() {
		String statement = "resource.AptMapper.selectAptinfo";
		List<AptVo> list = session.selectList(statement);
		System.out.println("-------DAO------");
		System.out.println(list);
		System.out.println("----------------");
		return list;
	}

	@Override
	public List<AptVo> listGu(String gu) {
		String statement = "";
		List<AptVo> list = null;
		statement = "resource.AptMapper.selectAptGuLoc";
		list = session.selectList(statement, gu);
		return list;
	}

	@Override
	public List<AptVo> list500(String t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CircleVo> list500Circle(String t) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
