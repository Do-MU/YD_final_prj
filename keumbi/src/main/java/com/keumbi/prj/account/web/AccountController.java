package com.keumbi.prj.account.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keumbi.prj.account.service.AccountService;
import com.keumbi.prj.account.vo.AccountVO;
import com.keumbi.prj.user.vo.UserVO;

@Controller
public class AccountController {
	
	@Autowired AccountService accService;
	
	// 계좌목록 view page
	// 인증되지 않은 회원 : accountList > [내 계좌불러오기] > bankAuth > bankCallBack > accountList
	@RequestMapping("/accountList")
	public String accountView(HttpSession session, Model model, HttpServletResponse response) throws IOException {
		UserVO user = (UserVO) session.getAttribute("loginUser");
		
		// 로그인 시
		if(user != null) {
			// 인증된 회원일 시
			if(user.getUser_seq_num() != null && !user.getUser_seq_num().isEmpty()) {
				List<AccountVO> myAccList = accService.selectfirstAccount(user);
				if(myAccList != null) {
					model.addAttribute("acc", myAccList);
				}else {
					user.setUser_seq_num("");
					user.setAccess_token("");
					user.setRefresh_token("");
					session.setAttribute("loginUser", user);
					
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script type='text/javascript'>");
					out.println("alert('다시 인증해주십시오.');");
					out.println("location.href='accountList';");
					out.println("</script>");
					out.flush();
				}
			}
			// 잔액 합산 출력
			model.addAttribute("accTotalSum", accService.selectAccTotalSum(user.getId()));
		}
		return "account/accountList";
	}
}