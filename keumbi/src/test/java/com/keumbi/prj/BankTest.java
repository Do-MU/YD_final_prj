package com.keumbi.prj;

import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BankTest {
	
	//@Test
	public void percentOfChall() {
		int sum = 3285000;
		int goal = 22090110;
		System.out.println("((double)sum/goal)*100 : "+((double)sum/goal)*100);
		System.out.println("Math.round( (double)sum/goal )*1000/10.0 : "+ Math.round( (double)sum/goal )*1000/10.0 );
		System.out.println("(Math.round( (double)sum/goal )*10/10.0)*100 : "+ (Math.round( (double)sum/goal )*10/10.0)*100);
		System.out.println( Math.round( (double)sum/goal *1000)/10.0 );
	}
	
	//@Test
	public void encMySelf() {
		String pwd = "1234";
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encPwd = encoder.encode(pwd);
		System.out.println(pwd);
		System.out.println(encPwd);
	}
	
	//@Test
	public void roundGoal() {
		int goal = 1572222;
		int rnd = 0;
		
		rnd = goal/1000*1000;
		
		System.out.println(goal);
		System.out.println(rnd);
	}
}
