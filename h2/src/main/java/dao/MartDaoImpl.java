package dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CircleVo;
import vo.MartVo;

@Repository
public class MartDaoImpl implements CategoryDao<List<MartVo>,String,List<CircleVo>>{

	@Autowired
	SqlSession session = null;
	
	@Override
	public List<MartVo> listAll() {
		String statement = "resource.MartMapper.selectMartinfo";
		List<MartVo> list = session.selectList(statement);
		System.out.println("-------DAO------");
		System.out.println(list);
		System.out.println("----------------");
		return list;
	}

	@Override
	public List<MartVo> listGu(String t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MartVo> list500(String t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CircleVo> list500Circle(String t) {
		// TODO Auto-generated method stub
		return null;
	}

}
