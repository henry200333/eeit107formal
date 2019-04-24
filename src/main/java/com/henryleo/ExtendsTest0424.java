package com.henryleo;

class Father{
	String name = "father";
	public String getName() {
		return name;
	}
}

class Son extends Father{
	String name = "son";
}

public class ExtendsTest0424 {

	public static void main(String[] args) {
		
		Father test = new Son();
		System.out.println(test.getName());
	}

}
