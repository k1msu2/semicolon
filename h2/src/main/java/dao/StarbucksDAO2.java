package dao;

import java.util.List;

import vo.StarbucksVO;

public interface StarbucksDAO2 {
	public List<StarbucksVO> listAll();
	public boolean insert(StarbucksVO vo);
}
