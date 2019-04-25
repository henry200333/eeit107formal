package com.henryleo;

public class HelloKitty {

	public static void main(String[] args) {
		
		String str1 = "1ab3ccb6";
		String[] result = str1.split("[abc]");
		for(int i = 0; i < result.length;i++) {
			System.out.println(result[i]);
		}
	}

}
