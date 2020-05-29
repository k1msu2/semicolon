package dao;

import java.util.List;

import vo.AptGraphDataVo;
import vo.CatVo;
import vo.CenterVo;
import vo.CircleVo;
import vo.DongVo;
import vo.GuVo;
import vo.OptionTbVo;
import vo.OptionVo;

public interface ViewDao {

	CenterVo CenterAll(String gu);
	List<GuVo> guListAll();
	List<DongVo> dongListAll(String gu);
	List<CatVo> catListAll();
	List<CircleVo> list500(String gu);
	List<CircleVo> listOption(OptionVo vo);
	List<CircleVo> listOptionTb(OptionTbVo tbvo);
	List<OptionTbVo> listNearGu(String gu);
	List<CircleVo> listOptionTbGu(OptionTbVo tbvo);
	List<CircleVo> listOptionTbDong(OptionTbVo tbvo);
	List<CircleVo> listOptionTbSeoul(OptionTbVo tbvo);
	List<AptGraphDataVo> listGraphData();

}
