package com.keumbi.prj.sanction.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.keumbi.prj.sanction.service.SanctionService;
import com.keumbi.prj.sanction.vo.SanctionVO;

@Controller
public class SanctionController {
	@Autowired SanctionService sc;
	
	// 제재회원 목록
	@RequestMapping("/admin/sanUser")
	@ResponseBody
	public List<SanctionVO> sanUser() {
		return sc.sanUser();
	}
	
	// 관리자 제재등록
	@RequestMapping("/admin/sanInsert")
	@ResponseBody
	public int sanInsert(SanctionVO vo) {
		System.out.println(vo);
		
		return sc.sanInsert(vo);
	}
}
