package com.keumbi.prj.user.serviceImpl;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.keumbi.prj.user.mapper.UserMapper;
import com.keumbi.prj.user.service.UserService;
import com.keumbi.prj.user.vo.UserManageVO;
import com.keumbi.prj.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired 	UserMapper m;
	@Autowired	private JavaMailSender mailSender;
	
	//회원 리스트, 회원 조회, 아이디/비밀번호 찾기시 입력한 정보와 DB비교
	@Override
	public UserVO userSelect(UserVO vo) {
		return m.userSelect(vo);
	}

	@Override
	public int userInsert(UserVO vo) {
		String[] arrBirth = vo.getBirth().split("-");
		String birth = "";
		for (String s : arrBirth) {
			birth += s;
		}
		vo.setBirth(birth.substring(2));
		
		return m.userInsert(vo);
	}	
	
	//회원정보,비밀번호 수정
	@Override
	public int userUpdate(UserVO vo) {
		return m.userUpdate(vo);
	}

	@Override
	public int userDelete(UserVO vo) {
		return m.userDelete(vo);
	}

	@Override
	public int userKwdInsert(String id, String[] keyword) {
		if (keyword != null) {
			for (String kwd : keyword) {
				m.userKwdInsert(id, kwd);
			}
		}
		return 1;
	}

	@Override
	public String userEmailChenk(String email) {

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

	@Override
	public int selectToken(UserVO vo) {
		return m.selectToken(vo);
	}

	@Override
	public int UpdateToken(UserVO vo) {
		return m.updateToken(vo);
	}

	@Override
	public int userKwdDelete(String id) {
		return m.userKwdDelete(id);
	}
	
	// 전체 회원정보 (관리자)
	@Override
	public List<UserManageVO> userList() {
		return m.userList();
	}
}
