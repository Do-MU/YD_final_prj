package com.keumbi.prj.kb.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keumbi.prj.kb.mapper.KeumbiMapper;

@Controller
public class KBController {

	@Autowired KeumbiMapper mapper;
	
	@RequestMapping("/teamKeumbi")
	public String teamKeumbi(Model model) {
		model.addAttribute("team", mapper.printTeamMember());
		return "kb/teamKeumbi";
	}
}
