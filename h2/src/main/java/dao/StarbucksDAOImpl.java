package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.StarbucksVO;

@Repository
public class StarbucksDAOImpl implements StarbucksDAO<List<StarbucksVO>>{

	@Autowired
	SqlSession session = null;

	@Override
	public List<StarbucksVO> listAll() {
		String statement = "resource.StarbucksMapper.selectStarbucksinfo";
		List<StarbucksVO> list = session.selectList(statement);
		System.out.println("-------DAO------");
		System.out.println(list);
		System.out.println("----------------");
		return list;
	}


}
