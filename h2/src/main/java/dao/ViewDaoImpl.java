package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CenterVo;
import vo.CircleVo;
import vo.DongVo;
import vo.GuVo;

@Repository
public class ViewDaoImpl implements ViewDao{

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

	@Override
	public List<GuVo> guListAll() {
		String statement = "";
		List<GuVo> list = null;
		statement = "resource.GuMapper.selectGuList";
		list = session.selectList(statement);
		System.out.println(list);
		return list;
	}

	@Override
	public List<DongVo> dongListAll(String gu) {
		String statement = "";
		List<DongVo> list = null;
		statement = "resource.DongMapper.selectDongList";
		list = session.selectList(statement, gu);
		System.out.println(list);
		return list;
	}

}
