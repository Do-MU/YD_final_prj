package com.keumbi.prj.accTrans.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.keumbi.prj.accTrans.service.AccTransService;
import com.keumbi.prj.accTrans.vo.AccTransReqVO;
import com.keumbi.prj.accTrans.vo.AccTransVO;

@Controller
public class AccTransController {

	@Autowired AccTransService accTransServiceImpl;
	
	// 거래내역 ajax -> db에서 불러옴
	@RequestMapping("/accTransRes")
	@ResponseBody
	public List<AccTransVO> accTransRes(AccTransReqVO vo) {
		
		return accTransServiceImpl.selectAccTrans(vo.getFintech_use_num());
	}
}
