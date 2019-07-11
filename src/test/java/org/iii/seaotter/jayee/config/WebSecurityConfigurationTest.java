package org.iii.seaotter.jayee.config;

import java.util.Scanner;

import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class WebSecurityConfigurationTest {

	@Test
	public void testPasswordEncoder() {
		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		System.out.println("↓請在這裡輸入想要轉換的密碼後，按下Enter↓");
		Scanner scanner = new Scanner(System.in);
		String userinput = scanner.next();
		System.out.println("===================================");
		System.out.println("您輸入的密碼為：");
		System.out.println(userinput);
		System.out.println("===================================");
		System.out.println("轉換後的密碼為：");
		System.out.println(bpe.encode(userinput));
		System.out.println("===================================");
		System.out.println("請注意，每次轉換的結果都不一樣是正常現象");
		scanner.close();
	}

}
