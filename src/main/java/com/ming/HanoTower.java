package com.ming;

public class HanoTower {

	public static void main(String[] args) {
		int spite=10;
		int f=1,l=3;
		move(f,l,spite);
	}
	static void move(int f,int l,int s) {
		int sp=6-f-l;
		if(s==1) {
			System.out.printf("%d盤子從 %d石柱移到%d石柱\n",s,f,l);
		}else {
		move(f,sp,s-1);
		System.out.printf("%d盤子從%d石柱移到%d石柱\n",s,f,l);
		move(sp,l,s-1);
		}
	}
}
