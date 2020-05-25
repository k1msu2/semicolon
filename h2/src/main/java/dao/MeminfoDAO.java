package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MeminfoVO;

@Repository
public class MeminfoDAO {
	@Autowired
	SqlSession session = null;

	
	//리스트로 출력해주는 기능? 아마도 내 정보 같은 데에 보여질 듯
	public List<MeminfoVO> listAll() {
		System.out.println("Mybatis 사용 DB 연동-listAll : MeminfoMybatisDAO");
		List<MeminfoVO> list = null;
		String statement = "resource.MeminfoMapper.selectMeminfo";
		list = session.selectList(statement);
		return list;
	}

	// insert 기능을 하는 메서드
	public boolean insert(MeminfoVO vo) {
		System.out.println("Mybatis를 사용 DB 연동-insert : MeminfoMybatisDAO");
		boolean result = false;
		String statement = "resource.MeminfoMapper.insertMeminfo";
		if (session.insert(statement, vo) == 1)
			result = true;
		return result;
	}

	// update 기능을 하는 메서드
	public boolean update(MeminfoVO vo) {
		System.out.println("Mybatis를 사용 DB 연동-update : MeminfoMybatisDAO");
		boolean result = false;
		String statement = "resource.MeminfoMapper.updateMeminfo";
		if (session.update(statement, vo) == 1)
			result = true;
		return result;		
	}

	// delete 기능을 하는 메서드
	public boolean delete(String mem_userid) {
		System.out.println("Mybatis를 사용 DB 연동-delete : MeminfoMybatisDAO");
		boolean result = false;
		String statement = "resource.MeminfoMapper.deleteMeminfo";
		if(session.delete(statement, mem_userid) == 1)
			result = true;
		return result;
	}

	// insert, update, delete 기능만 구현. 추후 필요한 기능이 생길 시 추가할 예정
	// SQL 구문이 맞는지 헷갈림...
}
