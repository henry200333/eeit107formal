package com.jasonpeng;

import java.util.Scanner;

public class ex1 {

	public static void main(String[] args) {

		System.out.println("k = ?");
		Scanner console1 = new Scanner(System.in);
		int k = console1.nextInt();

		System.out.println("String plz");
		Scanner console2 = new Scanner(System.in);
		String s = console2.nextLine();

		ans a = new ans();
		a.go(s, k);
		console1.close();
		console2.close();
	}

}

class ans {
	String str;
	int d, now = 0, check = 0, max = 0, need = 0;

	void go(String str, int d) {
		this.str = str;
		this.d = d;
		findmax();
		System.out.println(max);
	}

	boolean checkA() {
		if (now + d - 1 >= str.length()) {
			now++;
			return false;
		}
		for (int i = 0; i < d; i++) {
			if (Character.isUpperCase(str.charAt(now))) {
				now++;
				continue;
			} else {
				now = now - i + 1;
				return false;
			}
		}
		return true;
	}

	boolean checka() {
		if (now + d - 1 >= str.length()) {
			now++;
			return false;
		}
		for (int i = 0; i < d; i++) {
			if (Character.isLowerCase(str.charAt(now))) {
				now++;
				continue;
			} else {
				now = now - i + 1;
				return false;
			}
		}
		return true;
	}

	void findmax() {
		while (now < str.length()) {
			if (Character.isUpperCase(str.charAt(now)) && need != 1) {
				if (checkA()) {
					check = check + d;
					if (check >= max) {
						max = check;
					}
					need = 1;
				} else {
					check = 0;
					need = 0;
				}
			} else if (Character.isLowerCase(str.charAt(now)) && need != 2) {
				if (checka()) {
					check = check + d;
					if (check >= max) {
						max = check;
					}
					need = 2;
				} else {
					check = 0;
					need = 0;
				}
			} else {
				now = now - d + 1;
				check = 0;
				need = 0;
			}
		}
	}
}