package dao;

import java.util.List;

import vo.CatVo;
import vo.CenterVo;
import vo.CircleVo;
import vo.DongVo;
import vo.GuVo;
import vo.OptionVo;

public interface ViewDao {

	CenterVo CenterAll(String gu);
	List<GuVo> guListAll();
	List<DongVo> dongListAll(String gu);
	List<CatVo> catListAll();
	List<CircleVo> list500(String gu);
	List<CircleVo> listOption(OptionVo vo);

}
