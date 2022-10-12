package Controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import Service.UserService;
import VO.PlaceVO;
import VO.ToiletVO;
import VO.UserVO;
import common.ToiletPath;
import common.UserPath;


@Controller
public class UserController {
	private UserService service;


	public UserController(UserService service) {
		this.service = service;
	}
	
	@RequestMapping("/")
	public String Main() {
		return UserPath.PATH + "Main.jsp";
	}
	
	@RequestMapping("Join")
	public String Join() {
		return UserPath.PATH + "Join.jsp";
	}
	@RequestMapping("JoinForm")
	public String Join(UserVO vo, Model model) {
		
		int res = service.Join(vo);
			if(res != 0) {
				model.addAttribute("msg","회원가입성공");
				model.addAttribute("url","/");
				return UserPath.PATH + "result.jsp"; 
			}else {
				model.addAttribute("msg","회원가입실패");
				model.addAttribute("url","/");
				return UserPath.PATH + "result.jsp";
			}
		
	}
	
	@RequestMapping("Login")
	public String Login() {
		return UserPath.PATH + "Login.jsp";
	}
	
	@RequestMapping("LoginForm")//이쪽부분 오류 try -> NUll Point Exception 인데 어디부분이 null 로들어오는지 확인이안됨.
	public String Login(Model model, HttpServletRequest request, HttpSession session) {
		UserVO vo = new UserVO();
		vo.setID(request.getParameter("ID"));
		String pw = request.getParameter("PW");
		//System.out.println(vo.getID());
		vo = service.Login(vo);
		try {
		if(vo.getPW().equals(pw)) {
			session.setAttribute("Name", vo.getName());
			session.setAttribute("ID", vo.getID());
			model.addAttribute("vo", vo);
			model.addAttribute("msg","로그인성공");
			model.addAttribute("url","/");
			return UserPath.PATH + "result.jsp";
		}else {
			model.addAttribute("msg","로그인실패");
			model.addAttribute("url","/Login");
			return UserPath.PATH + "result.jsp";
		}
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg","로그인실패");
			model.addAttribute("url","/Login");
			return UserPath.PATH + "result.jsp";
		}
		
	}
	
	@RequestMapping("UserInfo")
	public String UserInfo(Model model , HttpServletRequest request) {
		//System.out.println(request.getParameter("ID"));
		UserVO vo = new UserVO();
		vo.setID(request.getParameter("ID"));
		vo = service.Login(vo);
		model.addAttribute("vo", vo);
		return UserPath.PATH + "UserInfo.jsp";
		
	}
	
	@RequestMapping("update")
	public String update(Model model, HttpServletRequest request) {
		UserVO vo = new UserVO();
		vo.setID(request.getParameter("ID"));
		vo = service.Update(vo);
		model.addAttribute("vo", vo);
		return UserPath.PATH + "UpdateForm.jsp";
	}
	
	@RequestMapping("UpdateForm")
	public String UpdateForm(UserVO vo, Model model, HttpSession session) {
		int result  = service.UpdateForm(vo);
		
		if(result != 0) {
			
			model.addAttribute("msg","수정성공");
			model.addAttribute("url","/");
			session.setAttribute("Name", vo.getName());
			return UserPath.PATH + "result.jsp";
		}else {
			model.addAttribute("msg","수정실패");
			model.addAttribute("url","/update");
			return UserPath.PATH + "result.jsp";
		}
	
	}
	
	@RequestMapping("delete")
	public String delete() {
		return UserPath.PATH + "DeleteForm.jsp";
	}
	
	@RequestMapping("DeleteForm")//이쪽부분 오류 try -> NUll Point Exception 인데 어디부분이 null 로들어오는지 확인이안됨.
	public String DeleteForm( HttpServletRequest request, Model model, HttpSession session) {
		UserVO vo = new UserVO();
		String ID = request.getParameter("ID");
		vo.setID(ID);
		String PW = request.getParameter("pw");
		UserVO vo2 = service.Login(vo);
		
		try {
		if(vo2.getPW().equals(PW)) {
			service.delete(request.getParameter("ID"));
			model.addAttribute("msg","삭제성공");
			model.addAttribute("url","/");
			session.invalidate();
			return UserPath.PATH + "result.jsp";
		
		}else {
			model.addAttribute("msg","삭제실패");
			model.addAttribute("url","/delete");
			return UserPath.PATH + "result.jsp";
		}
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg","삭제실패");
			model.addAttribute("url","/delete");
			return UserPath.PATH + "result.jsp";
		}
		
	}
	
	@RequestMapping("LogOut")
	public String LogOut(HttpSession session, Model model){
		session.invalidate();
		model.addAttribute("msg","로그아웃성공, 처음화면으로");
		model.addAttribute("url","/");
		return UserPath.PATH + "result.jsp";
		
		
	}
	
	@RequestMapping("Toilet")
	public String  Toilet(HttpServletRequest request,Model model,ToiletVO vo,BigDecimal lat, BigDecimal lng) {
		System.out.println(lat);
		System.out.println(lng);
		vo.setLat(lat);
		vo.setLng(lng);
		
		
		List<ToiletVO> list = service.selectList(vo);
		
		
		model.addAttribute("list", list);
		return ToiletPath.PATH2 + "Toilet.jsp";
		
	}
	
	@RequestMapping("ToiletReview")
	public String ToiletReview(String title,HttpServletRequest request,Model model) {
		String name = request.getParameter("title");
		model.addAttribute("name", name);
		return ToiletPath.PATH2 + "Review.jsp";
	}
	
	@RequestMapping("ReviewForm")
	public String ReviewForm(String name,int reviewStar, HttpServletRequest request, Model model, PlaceVO vo) {
		vo.setStar(reviewStar);
		vo.setTitle(name);
		System.out.println(name);
		System.out.println(vo.getTitle());
		int result = service.Review(vo);
		System.out.println(result);
		
			if(result == 1) {
				
				model.addAttribute("msg","리뷰 성공!!");
				model.addAttribute("url","/");
				
				return UserPath.PATH + "result.jsp";
			
			}else {
				model.addAttribute("msg","리뷰실패!");
				model.addAttribute("url","/ToiletReview");
				return UserPath.PATH + "result.jsp";
			
			}
	}
			
	@RequestMapping(value = "GetStar", method=RequestMethod.POST)
	@ResponseBody
	public int GetStar(String title,PlaceVO vo,Model model) {
		System.out.println(title);
		vo.setTitle(title);
		
		String result = service.StarReview(title);
		int re;
		if(result == null) {
			re = 0;
		}else {
		 re = Integer.parseInt(result);
		}
		
		
		return re;
	}
	

	
	
	


		


	
	

}
