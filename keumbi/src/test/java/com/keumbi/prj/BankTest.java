package com.keumbi.prj;

import org.junit.Test;

public class BankTest {
	
	@Test
	public void whyAnNaWa() {
		int sum = 3285000;
		int goal = 22090110;
		System.out.println("((double)sum/goal)*100 : "+((double)sum/goal)*100);
		System.out.println("Math.round( (double)sum/goal )*1000/10.0 : "+ Math.round( (double)sum/goal )*1000/10.0 );
		System.out.println("(Math.round( (double)sum/goal )*10/10.0)*100 : "+ (Math.round( (double)sum/goal )*10/10.0)*100);
		System.out.println( Math.round( (double)sum/goal *1000)/10.0 );
	}
}
