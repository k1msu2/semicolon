package dao;

import java.util.List;

import vo.AptGraphDFVo;
import vo.AptGraphDataVo;
import vo.AptGraphGuVo;
import vo.AptGraphSearchVo;

public interface GraphDao {
	List<AptGraphDataVo> listGraphData(String aptname);
	List<AptGraphDFVo> listGraphDF(String aptname);
	List<AptGraphGuVo> listGraphGuData(AptGraphSearchVo vo);

}
