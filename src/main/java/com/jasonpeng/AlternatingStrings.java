package com.jasonpeng;

import java.util.Scanner;

public class AlternatingStrings {

	public static void main(String[] args) {

		System.out.println("k = ?");
		Scanner console1 = new Scanner(System.in);
		int k = console1.nextInt();


		System.out.println("String plz");
		Scanner console2 = new Scanner(System.in);
		String s = console2.nextLine();

		console1.close();
		console2.close();


		int cU = 0;// count Uppercase
		int cL = 0;// count Lowercase
		int len = 0;// temporary lenth
		int flen = 0;// final lenth
		boolean bu = true; // first caracter is uppercase or not

		if (Character.isUpperCase(s.charAt(0))) {
			bu = true;
			cU++;
			if (cU == k) {
				len = k;
				flen = Math.max(flen, len);
			}
//			System.out.println(bu);
		} else if (Character.isLowerCase(s.charAt(0))) {
			bu = false;
			cL++;
			if (cL == k) {
				len = k;
				flen = Math.max(flen, len);
			}
//			System.out.println(bu);

		}
		for (int i = 1; i < s.length(); i++) {
			if (bu == true) {
				if (Character.isUpperCase(s.charAt(i))) {
//					System.out.println("AA");
					cU++;
					cL = 0;
					if (cU == k) {
						len = len + k;
						flen = Math.max(flen, len);
					}
					if (cU > k) {
						len = k;
					}

				} else if (Character.isLowerCase(s.charAt(i))) {
//					System.out.println("Aa");

					if (cU < k) {
						len = 0;
					}
					cL = 1;
					cU = 0;
					if (cL == k) {
						len = len + k;
						flen = Math.max(flen, len);
					}
					bu = false;

				}

			} else if (bu == false){
				if (Character.isUpperCase(s.charAt(i))) {
//					System.out.println("aA");

					if (cL < k) {
						len = 0;
					}
					cU = 1;
					cL = 0;
					if (cU == k) {
						len = len + k;
						flen = Math.max(flen, len);
					}
					bu = true;
				} else if (Character.isLowerCase(s.charAt(i))) {
//					System.out.println("aa");

					cL++;
					cU = 0;
					if (cL == k) {
						len = len + k;
						flen = Math.max(flen, len);
					}
					if (cL > k) {
						len = k;
					}
				}

			}

		}
		System.out.println(flen);

	}

}
