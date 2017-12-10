package com.work.bean;

public class MorrisLine {
	
	private String x;
	private double d1;
	private double d2;
	
	public MorrisLine() {}
	
	public MorrisLine(String x, double d1, double d2) {
		this.x = x;
		this.d1 = d1;
		this.d2 = d2;
	}
	
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}

	public double getD1() {
		return d1;
	}

	public void setD1(double d1) {
		this.d1 = d1;
	}

	public double getD2() {
		return d2;
	}

	public void setD2(double d2) {
		this.d2 = d2;
	}
	
	
}
