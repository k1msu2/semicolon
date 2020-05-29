package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.AptGraphDataVo;
import vo.CatVo;
import vo.CenterVo;
import vo.CircleVo;
import vo.DongVo;
import vo.GuVo;
import vo.OptionTbVo;
import vo.OptionVo;

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

	@Override
	public List<CatVo> catListAll() {
		String statement = "";
		List<CatVo> list = null;
		statement = "resource.CatMapper.selectCatList";
		list = session.selectList(statement);
		System.out.println(list);
		return list;
	}
	
	@Override
	public List<CircleVo> list500(String gu) {
		String statement = "";
		List<CircleVo> list = null;
		statement = "resource.CafeMapper.selectCafeIn500";
		list = session.selectList(statement, gu);
		return list;
	}

	@Override
	public List<CircleVo> listOption(OptionVo vo) {
		String statement = "";
		List<CircleVo> list = null;		
		statement = "resource.OptionMapper.selectOptionPosList";
		list = session.selectList(statement, vo);
		return list;
	}
	@Override
	public List<CircleVo> listOptionTbGu(OptionTbVo tbvo) {
		String statement = "";
		List<CircleVo> list = null;		
		statement = "resource.OptionMapper.selectOptionGuList";
		System.out.println(tbvo);
		list = session.selectList(statement,tbvo);
		return list;
	}
	
	@Override
	public List<CircleVo> listOptionTbSeoul(OptionTbVo tbvo) {
		String statement = "";
		List<CircleVo> list = null;		
		statement = "resource.OptionMapper.selectOptionSList";
		System.out.println(tbvo);
		list = session.selectList(statement,tbvo);
		return list;
	}
	@Override
	public List<CircleVo> listOptionTbDong(OptionTbVo tbvo) {
		String statement = "";
		List<CircleVo> list = null;		
		statement = "resource.OptionMapper.selectOptionDongList";
		System.out.println(tbvo);
		list = session.selectList(statement,tbvo);
		return list;
	}


	@Override
	public List<OptionTbVo> listNearGu(String gu) {
		String statement="resource.OptionMapper.selectTbList";
		List<OptionTbVo> list = session.selectList(statement, gu);
		return list;
	}

	@Override
	public List<CircleVo> listOptionTb(OptionTbVo tbvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AptGraphDataVo> listGraphData() {
		// TODO Auto-generated method stub
		return null;
	}
	

}
