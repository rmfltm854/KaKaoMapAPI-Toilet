package Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import DAO.UserDAO;
import VO.PlaceVO;
import VO.ToiletVO;
import VO.UserVO;


public class UserService {
	
	private UserDAO dao;

	public UserService(UserDAO dao) {
		this.dao = dao;
	}
	
	public int Join(UserVO vo) {
		return dao.Join(vo);
	}
	
	public UserVO Login(UserVO vo) {
		return dao.Login(vo);
	}
	
	public UserVO Update(UserVO vo) {
		return dao.Update(vo);
	}
	
	public int UpdateForm(UserVO vo) {
		int res = dao.UpdateForm(vo);
		return res;
	}
	
	public int delete(String PW) {
		int result = dao.delete(PW);
		return result;
	}
	
	public List<ToiletVO> selectList(ToiletVO vo){
		return dao.selectList(vo);
	}
	
	public int Review(PlaceVO vo) {
		return dao.Review(vo);
	}
	
	public String StarReview(String title) {
		return dao.StarReview(title);
	}
}
