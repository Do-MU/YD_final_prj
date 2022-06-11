package com.keumbi.prj.user.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.common.service.CodeService;
import com.keumbi.prj.common.service.TermService;
import com.keumbi.prj.common.vo.CodeVO;
import com.keumbi.prj.noti.service.NotiService;
import com.keumbi.prj.noti.vo.NotiVO;
import com.keumbi.prj.user.service.UserService;
import com.keumbi.prj.user.vo.SancUserSearchVO;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class UserController {

	@Autowired	UserService service;
	@Autowired	CodeService code;
	@Autowired	TermService term;
	@Autowired	NotiService noti;
	@Autowired  BCryptPasswordEncoder passwordEncoder;
	
	// 로그인 화면 출력
	@RequestMapping("/userLoginForm")
	public String userLoginForm(HttpSession session) {
		// 로그아웃 처리
		if (session.getAttribute("loginUser") != null) {
			session.invalidate();
		}
		return "user/userLoginForm";
	}

	// 로그인 처리
	@RequestMapping("/userLogin")
	public String userLogin(HttpSession session, UserVO userVO, HttpServletResponse response, Model model){
		UserVO loginUser = service.userSelect(userVO);
		if (loginUser != null && passwordEncoder.matches(userVO.getPw(), loginUser.getPw())) {
			session.setAttribute("loginUser", loginUser);
			
			if(loginUser.getId().equals("admin")) {			// 관리자 로그인
				
				return "redirect:admin/";
			}else {
				return "redirect:home";
			}
		}else{
			model.addAttribute("message", "fail");
			System.out.println("비밀번호가 틀렸습니다.");
			return "user/userLoginForm";
		}
	}

	// 회원가입 화면 출력	
	@RequestMapping("/joinForm")
	public String joinForm(Model model) {
		model.addAttribute("code", code.keywordCode());
		model.addAttribute("term", term.joinTerm());
		
		return "joinForm";
	}

	// 회원가입 처리
	@RequestMapping("/userJoin")
	public String userJoin(UserVO userVO, @RequestParam(required = false) String[] keyword) {
		
		// 회원가입 메서드
		service.userInsert(userVO);
		service.userKwdInsert(userVO.getId(), keyword);
		
		// 회원가입 알림 -> userId
		NotiVO nvo = new NotiVO();
		nvo.setUser_id(userVO.getId());
		nvo.setNoti_code("N11");
		noti.notiInsert(nvo);
		
		return "redirect:home";
	}
	
	// 회원정보 수정 화면
	@RequestMapping("/userUpdateForm")
	public String userUpdateForm(Model model) {
		model.addAttribute("code", code.keywordCode());
		
		return "user/userUpdateForm";
	}

	// 회원 정보 수정 처리
	@RequestMapping("/userUpdate")
	public String userUpdate(UserVO userVO, @RequestParam(required = false) String[] keyword,HttpSession session) {

		service.userUpdate(userVO);
		service.userKwdDelete(userVO.getId());
		service.userKwdInsert(userVO.getId(), keyword);
		
		session.setAttribute("loginUser", service.userSelect(userVO));		// 수정된 회원정보를 세션에 저장
			
		return "redirect:userUpdateForm";
	}
	
	// 회원 탈퇴 처리
	@RequestMapping("/userDelete")
	public String userDelete(HttpSession session) {
		UserVO vo = (UserVO) session.getAttribute("loginUser"); // 세션값 불러오기
		service.userDelete(vo);
		session.invalidate();
		return "redirect:home";
	}
	
	// 탈퇴 철회 처리
	@RequestMapping("/userCancle")
	public String userCancle(HttpSession session, UserVO uservo) {
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		service.userCancle(vo);
		UserVO loginUser = service.userSelect(vo);
		session.setAttribute("loginUser", loginUser);
		return "redirect:home";
	}
	
	//세션 삭제
	@RequestMapping("/userSessionDelete")
	public String userSessionDelete(HttpSession session) {
		session.invalidate();
		return "redirect:home";
	}
	
	// aJax----------------------------------------------------------------------------------------
	// ID 중복체크
	@RequestMapping("/idCheck")
	@ResponseBody
	public String idCheck(UserVO userVO) {
		UserVO check = service.userSelect(userVO);
		if (check != null) {
			return check.getId();
		}
		return null;
	}

	// 이메일 인증
	@RequestMapping("/mailCheck")
	@ResponseBody
	public String mailCheckGET(String email) {

		return service.userEmailChenk(email);
	}

	// 아이디 찾기
	@RequestMapping("/userIdFind")
	@ResponseBody
	public UserVO userIdFind(UserVO userVO) {
		return service.userSelect(userVO);
	}

	// 비밀번호 찾기
	@RequestMapping("/userPwFind")
	@ResponseBody
	public UserVO userPwFind(UserVO userVO) {
		return service.userSelect(userVO);
	}

	// 비밀번호 변경
	@RequestMapping("/userPwUpdate")
	@ResponseBody
	public int userPwUpdate(UserVO userVO) {
		
		return service.userUpdate(userVO);
	}
	
	// 회원 관심 키워드 select
	@RequestMapping("/selectUserKwdCode")
	@ResponseBody
	public List<CodeVO> selectUserKwdCode(HttpSession session) {
		UserVO vo = (UserVO) session.getAttribute("loginUser"); // 세션값 불러오기
		
		return code.selectUserKwdCode(vo.getId());
	}
	
	// 회원 검색 (관리자)
	@RequestMapping("/admin/userSearch")
	@ResponseBody
	public List<Map> userSearch(SancUserSearchVO vo){
		return service.userSearch(vo);
	}
}
