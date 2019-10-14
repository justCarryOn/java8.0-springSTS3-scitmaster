package com.test.web.vo;

public class TestVO {

	private String a;
	private int b;

	public TestVO() {
	}

	public TestVO(String a, int b) {
		super();
		this.a = a;
		this.b = b;
	}

	public String getA() {
		return a;
	}

	public void setA(String a) {
		this.a = a;
	}

	public int getB() {
		return b;
	}

	public void setB(int b) {
		this.b = b;
	}

	@Override
	public String toString() {
		return "TestVO [a=" + a + ", b=" + b + "]";
	}
}
