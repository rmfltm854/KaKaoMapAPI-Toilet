package DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import VO.PlaceVO;
import VO.ToiletVO;
import VO.UserVO;

public class UserDAO {
	
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int Join(UserVO vo) {
		return sqlSession.insert("user.insert",vo);
		
	}
	
	public UserVO Login(UserVO vo) {
		return sqlSession.selectOne("user.selectOne",vo);
	}
	
	public UserVO Update(UserVO vo) {
		return sqlSession.selectOne("user.UpdateInt",vo);
	}
	
	public int UpdateForm(UserVO vo) {
		int res = sqlSession.update("user.update",vo);
		return res;
	}
	
	public int delete(String PW) {
		int result =  sqlSession.delete("user.delete",PW);
		return result;
	}
	
	public List<ToiletVO> selectList(ToiletVO vo){
		return sqlSession.selectList("user.LocationBase",vo);
	}
	
	public int Review(PlaceVO vo) {
		return sqlSession.update("user.Review",vo);
	}
	
	public String StarReview(String title) {
		return sqlSession.selectOne("user.StarReview",title);
	}
}
