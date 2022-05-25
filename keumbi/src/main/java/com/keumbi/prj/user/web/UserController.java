package com.keumbi.prj.user.web;

import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.common.service.CodeService;
import com.keumbi.prj.common.service.TermService;
import com.keumbi.prj.common.vo.CodeVO;
import com.keumbi.prj.user.service.UserService;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class UserController {

	@Autowired	UserService service;
	@Autowired	CodeService code;
	@Autowired	TermService term;
	
	@Autowired	private JavaMailSender mailSender;

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
	public String userLogin(HttpSession session, UserVO userVO, HttpServletResponse response) throws Exception {
		UserVO loginUser = service.userSelect(userVO);
		if (loginUser != null && loginUser.getPw().equals(userVO.getPw())) {
			session.setAttribute("loginUser", loginUser);
			return "redirect:home";
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('아이디 또는 비밀번호가 일치하지 않습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			return "redirect:userLoginForm";
		}
	}

	// 회원가입 화면 출력
	
	@RequestMapping("/userJoinForm")
	public String userJoinForm(Model model) {
	model.addAttribute("code", code.keywordCode());
	return "user/userJoinForm";
	}
	
	@RequestMapping("/joinForm")
	public String joinForm(Model model) {
		model.addAttribute("code", code.keywordCode());
		model.addAttribute("term", term.joinTerm());
		return "joinForm";
	}

	// 회원가입 처리
	@RequestMapping("/userJoin")
	public String userJoin(UserVO userVO, @RequestParam(required = false) String[] keyword) {
		service.userInsert(userVO);
		
		if (keyword != null) {
			for (String kwd : keyword) {
				service.userKwdInsert(userVO.getId(), kwd);
			}
		}
		return "redirect:home";
	}
	
	
	//회원정보 수정 폼
	@RequestMapping("/userUpdateForm")
	public String userUpdateForm(Model model,HttpSession session) {
		UserVO vo = (UserVO) session.getAttribute("loginUser"); // 세션값 불러오기
		String userId = vo.getId(); // 세션에 저장된 ID값

		model.addAttribute("code", code.keywordCode());
		return "user/userUpdateForm";
	}

	//회원 정보 수정
	@RequestMapping("/userUpdate")
	public String userUpdate(UserVO userVO, @RequestParam(required = false) String[] keyword,HttpSession session) {
		service.userUpdate(userVO);
			
		for(String kwd : keyword) {
			service.userKwdDelete(userVO.getId(), kwd);
		}
		
		for(String kwd : keyword) {
			service.userKwdInsert(userVO.getId(), kwd);
		}
			
		UserVO loginUser = service.userSelect(userVO);
		session.setAttribute("loginUser", loginUser);
			
		return "redirect:userUpdateForm";
	}
	
	//회원 탈퇴
	@RequestMapping("/userDelete")
	public String userDelete(HttpSession session) {
		UserVO vo = (UserVO) session.getAttribute("loginUser"); // 세션값 불러오기
		service.userDelete(vo);
		session.invalidate();
		return "home/home";
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

		/* 뷰(View)로부터 넘어온 데이터 확인 */
		System.out.println("이메일 데이터 전송 확인");
		System.out.println("인증번호 : " + email);

		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);

		System.setProperty("https.protocols", "TLSv1,TLSv1.1,TLSv1.2");
		/* 이메일 보내기 */
		String setForm = "ckatnc12@gmail.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setForm);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum);

		return num;
	}

	// 아이디 찾기
	@RequestMapping("/userIdFind")
	@ResponseBody
	public String userIdFind(UserVO userVO) {
		
		return service.userIdFind(userVO);
	}

	// 비밀번호 찾기
	@RequestMapping("/userPwFind")
	@ResponseBody
	public String userPwFind(UserVO userVO) {
		
		return service.userPwFind(userVO);
	}

	// 비밀번호 변경
	@RequestMapping("/userPwUpdate")
	@ResponseBody
	public int userPwUpdate(UserVO userVO) {
		
		return service.userPwUpdate(userVO);
	}
	
	// 코드
	@RequestMapping("/selectUserKwdCode")
	@ResponseBody
	public List<CodeVO> selectUserKwdCode(HttpSession session) {
		UserVO vo = (UserVO) session.getAttribute("loginUser"); // 세션값 불러오기
		String userId = vo.getId(); // 세션에 저장된 ID값	
		return code.selectUserKwdCode(userId);
	}
	
	
}
