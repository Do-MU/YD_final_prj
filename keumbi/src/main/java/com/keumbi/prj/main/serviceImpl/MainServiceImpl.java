package com.keumbi.prj.main.serviceImpl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keumbi.prj.main.mapper.MainMapper;
import com.keumbi.prj.main.service.MainService;
import com.keumbi.prj.main.vo.MainVO;

@Service
public class MainServiceImpl implements MainService {
		@Autowired MainMapper m;

		@Override
		public MainVO cntUser() {
			return m.cntUser();
		}

		@Override
		public MainVO cntPrd() {
			return m.cntPrd();
		}

		@Override
		public MainVO cntFinance() {
			return m.cntFinance();
		}
}
