package com.work.bean;

public class RatingModel {

	private String name;
	private double max;
	private double middle;
	private double min;
	private double value;
	private double score; //得分
	private boolean flag;
	
	
	public RatingModel() {};
	
	/**
	 * 
	 * @param name
	 * @param value
	 * @param score
	 */
	public RatingModel(String name, double value, double score) {
		this.name = name;
		this.value = value;
		this.score = score;
	}
	
	/**
	 * 
	 * @param name
	 * @param max
	 * @param middle
	 * @param min
	 */
	public RatingModel(String name,double max, double middle, double min, boolean flag) {
		this.name = name;
		this.max = max;
		this.middle = middle;
		this.min = min;
		this.flag = flag;
	}
	
	public String toString() {
		return "name:"+getName()+" value:"+getValue()+" max:"+getMax()+" min:"+getMin()+" score:"+getScore();
	}
	
	public double getMax() {
		return max;
	}
	public void setMax(double max) {
		this.max = max;
	}
	public double getMiddle() {
		return middle;
	}
	public void setMiddle(double middle) {
		this.middle = middle;
	}
	public double getMin() {
		return min;
	}
	public void setMin(double min) {
		this.min = min;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public double getValue() {
		return value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	
	
	
}
