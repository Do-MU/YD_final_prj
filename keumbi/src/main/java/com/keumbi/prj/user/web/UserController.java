package com.keumbi.prj.user.web;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.common.service.CodeService;
import com.keumbi.prj.common.vo.CodeVO;
import com.keumbi.prj.user.service.UserService;
import com.keumbi.prj.user.vo.UserVO;


@Controller
public class UserController {
	
	@Autowired UserService service;
	@Autowired private JavaMailSender mailSender;
	@Autowired CodeService code;
	
	// 로그인 화면 출력
	@RequestMapping("/userLoginForm")
	public String userLoginForm(HttpSession session) {
		if(session.getAttribute("loginUser") != null) {
			session.invalidate();
		}
		return "user/userLoginForm";
	}
	
	// 로그인 처리
	@RequestMapping("/userLogin")
	public String userLogin(HttpSession session, UserVO userVO) {
		UserVO loginUser = service.userSelect(userVO); 
		
		if(loginUser != null && loginUser.getPw().equals(userVO.getPw())) {
			session.setAttribute("loginUser", loginUser);
			return "redirect:home";
		}else {
			return "redirect:userLoginForm";
		}		
	}
	
	// 회원가입 화면 출력
	@RequestMapping("/userJoinForm")
	public String userJoinForm(Model model) {
		model.addAttribute("code", code.keywordCode());
		return "user/userJoinForm";
	}
	
	// ID 중복체크
	@RequestMapping(value="/idCheck", produces="application/text; charset=utf8")
	@ResponseBody
	public String idCheck(HttpServletResponse response, UserVO userVO) {
		UserVO check = service.userSelect(userVO);
		response.setContentType("text/html; charset=UTF-8");
		if(check != null) {
			return "이미 사용중인 아이디 입니다.";
		}else {
			return "사용 가능한 아이디 입니다.";
		}
	}
	
	// 이메일 인증
    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
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
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

        try {       
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setForm);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
    }
    
    // 회원가입 처리
    @RequestMapping("/userJoin")
    public String userJoin(UserVO userVO,@RequestParam(required = false) String[] keyword) {
    	userVO.setGender_code("G"+ (Integer.parseInt(userVO.getGender_code())%2 == 0? "2":"1") );
    	service.userInsert(userVO);
    	if(keyword != null) {
    		for(String s : keyword) {
    			service.userKwdInsert(userVO.getId(), s);
    		}    		
    	}
    	return "redirect:home";
    }
    
    // 아이디 찾기
    @RequestMapping("/userIdFind")
    @ResponseBody
    public String userIdFind(UserVO userVO) {
    	String id = service.userIdFind(userVO);
    	return id;
    }
    
    // 비밀번호 찾기
    @RequestMapping("/userPwFind")
    @ResponseBody
    public String userPwFind(UserVO userVO) {
    	String result = service.userPwFind(userVO);
		return result;
    }
    
    // 비밀번호 변경
    @RequestMapping("/userPwUpdate")
    @ResponseBody
    public int userPwUpdate(UserVO userVO) {
    	System.out.println(userVO);
    	int result = service.userPwUpdate(userVO);
    	return result;
    }
}
