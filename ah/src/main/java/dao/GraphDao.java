package dao;

import java.util.List;

import vo.AptGraphDataVo;

public interface GraphDao {
	List<AptGraphDataVo> listGraphData(String gu);

}
