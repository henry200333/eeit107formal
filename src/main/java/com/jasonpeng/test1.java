package com.jasonpeng;

public class test1 {

	public static void main(String[] args) {

		int k = 1;
		String s = "aaAAaA";
		int cU = 0;// �s��j�g����
		int cL = 0;// �s��p�g����
		int len = 0;// �ثe���r��������
		int flen = 0;// �ثe����T�w���r�����
		boolean bu; // �e�@���O�_���j�g

		if (Character.isUpperCase(s.charAt(0))) {
			bu = true;
			cU++;
			if (cU == k) {
				len = k;
				flen = Math.max(flen, len);
			}
			System.out.println(bu);
		} else if (Character.isLowerCase(s.charAt(0))) {
			bu = false;
			cL++;
			if (cL == k) {
				len = k;
				flen = Math.max(flen, len);
			}
			System.out.println(bu);

		}
		for (int i = 1; i < s.length(); i++) {
			if (bu = true) {
				if (Character.isUpperCase(s.charAt(i))) {
					cU++;
					cL = 0;
					if (cU == k) {
						len = len + k;
						System.out.println("AA" + len);
						flen = Math.max(flen, len);
					}
					if (cU > k) {
						len = k;
					}

				} else if (Character.isLowerCase(s.charAt(i))) {
					if (cU < k) {
						len = 0;
					}
					cL = 1;
					cU = 0;
					if (cL == k) {
						len = len + k;
						System.out.println("Aa" + len);
						flen = Math.max(flen, len);
					}
					bu = false;

				}

			} else if (bu = false) {
				if (Character.isUpperCase(s.charAt(i))) {
					if (cL < k) {
						len = 0;
					}
					cU = 1;
					cL = 0;
					if (cU == k) {
						len = len + k;
						System.out.println("aA" + len);
						flen = Math.max(flen, len);
					}
					bu = true;
				} else if (Character.isLowerCase(s.charAt(i))) {
					cL++;
					cU = 0;
					if (cL == k) {
						len = len + k;
						System.out.println("aa" + len);
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
