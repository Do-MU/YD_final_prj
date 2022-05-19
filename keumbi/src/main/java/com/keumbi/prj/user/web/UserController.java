package com.keumbi.prj.user.web;

import java.util.Random;

import javax.mail.internet.MimeMessage;
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
import com.keumbi.prj.user.service.UserService;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class UserController {

	@Autowired	UserService service;
	@Autowired	private JavaMailSender mailSender;
	@Autowired	CodeService code;
	@Autowired	TermService term;

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
	public String userLogin(HttpSession session, UserVO userVO) {
		UserVO loginUser = service.userSelect(userVO);

		if (loginUser != null && loginUser.getPw().equals(userVO.getPw())) {
			session.setAttribute("loginUser", loginUser);
			return "redirect:home";
		} else {
			return "redirect:userLoginForm";
		}
	}

	// 회원가입 화면 출력
	/*
	@RequestMapping("/userJoinForm")
	public String userJoinForm(Model model) {
	model.addAttribute("code", code.keywordCode());
	return "user/userJoinForm";
	}
	*/
	@RequestMapping("/joinForm")
	public String joinForm(Model model) {
		model.addAttribute("code", code.keywordCode());
		model.addAttribute("term", term.joinTerm());
		return "joinForm";
	}

	// 회원가입 처리
	@RequestMapping("/userJoin")
	public String userJoin(UserVO userVO, @RequestParam(required = false) String[] keywords) {
		service.userInsert(userVO);
		
		if (keywords != null) {
			for (String kwd : keywords) {
				service.userKwdInsert(userVO.getId(), kwd);
			}
		}
		return "redirect:home";
	}

	// 나의 챌린지
	@RequestMapping("/userChallengeList")
	public String userChallengeList() {
		
		return "user/userChallengeList";
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
}
