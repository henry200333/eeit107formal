package com.ming;

public class ArrayCircle {

	public static void main(String[] args) {
		int x = 10, y = 10;
		int[][] a = new int[x][y];
		cas cas = new cas();
		int mod = 1, m = 0, n = 0;
		a[0][0] = 1;
		for (int i = 2; i <= x * y; i++) {

			while (true) { //?™£??—ç?„å?å?Šé??0??›æ–¹???
				if (n + cas.y >= y || n + cas.y < 0 || m + cas.x >= x || m + cas.x < 0) {
					cas.change(mod);
					mod++;
					continue;
				} else if (a[m + cas.x][n + cas.y] != 0) {
					cas.change(mod);
					mod++;
					continue;
				} else {
					break;
				}
			}
			n = n + cas.y;
			m = m + cas.x;
			a[m][n] = i;
		}

		for (n = 0; n < y; n++) { // é¡¯ç¤ºçµæ??
			for (m = 0; m < x; m++) {
				System.out.printf("%4d", a[m][n]);
			}
			System.out.println();
		}
	}
}

class cas { //?–¹??‘æ¨¡å¼è?‰æ??
	int x = 1;
	int y = 0;

	void change(int c) {
		if ((c + 4) % 4 == 1) {
			x = 0;
			y = -1;
		} else if ((c + 4) % 4 == 2) {
			x = -1;
			y = 0;
		} else if ((c + 4) % 4 == 3) {
			x = 0;
			y = 1;
		} else if ((c + 4) % 4 == 0) {
			x = 1;
			y = 0;
		}
	}
}
