package dao;

import java.util.List;

import vo.CenterVo;
import vo.DongVo;
import vo.GuVo;

public interface ViewDao {

	CenterVo CenterAll(String gu);
	List<GuVo> guListAll();
	List<DongVo> dongListAll(String gu);

}
