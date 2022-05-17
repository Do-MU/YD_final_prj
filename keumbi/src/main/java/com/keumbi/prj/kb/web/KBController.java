package com.keumbi.prj.kb.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keumbi.prj.kb.service.KeumbiService;

@Controller
public class KBController {

	@Autowired KeumbiService svc;
	
	@RequestMapping("/teamKeumbi")
	public String teamKeumbi(Model model) {
		model.addAttribute("team", svc.selectTeamMember());
		
		return "kb/teamKeumbi";
	}
}
