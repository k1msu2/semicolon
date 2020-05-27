package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CenterVo;

@Repository
public class CenterDaoImpl implements CenterDao{

	@Autowired
	SqlSession session = null;
	
	@Override
	public CenterVo CenterAll(String gu) {
		String statement = "";
		CenterVo vo = null;
		statement = "resource.CenterMapper.selectCenter";
		vo = session.selectOne(statement, gu);
		return vo;
	}
	
	/*	@Override
	public CenterVo CenterAll2(String gu, String dong) {
		String statement = "";
		CenterVo vo = null;
		statement = "resource.CenterMapper.selectCenter";
		vo = session.selectOne(statement, name);
		return vo;
	}*/
}
