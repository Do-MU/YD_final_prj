package com.keumbi.prj.report.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


import com.keumbi.prj.report.service.ReportService;

@Controller
public class ReportController {
	@Autowired ReportService reps;

}
