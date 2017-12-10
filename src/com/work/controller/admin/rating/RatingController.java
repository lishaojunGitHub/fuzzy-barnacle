package com.work.controller.admin.rating;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Record;
import com.work.bean.MorrisLine;
import com.work.bean.RatingModel;
import com.work.model.customer.Customer;
import com.work.model.rateing.BondBalanceSheet;
import com.work.util.Const;
import com.work.util.DateUtil;
import com.work.util.RequestUtil;


public class RatingController extends Controller{

	
	/**
	 * 股东构成
	 */
	public void stockholder() {
		String customer = RequestUtil.getParam(getRequest(), "customer", "");
		if (customer.trim().length()==0)
			customer = getSession().getAttribute(Const.SESSIONCUSTOMER)==null?"":(String)getSession().getAttribute(Const.SESSIONCUSTOMER);
		getSession().setAttribute(Const.SESSIONCUSTOMER, customer);
		
		setAttr("customer", customer);
		if (customer.length() > 0) {
			Record bean = Customer.get(customer, Const.INDUSTRY);
			setAttr("bean", bean);
		}
		renderFreeMarker("/WEB-INF/views/admin/rating/stockholder.ftl");
	}
	
	/**
	 * 基本信息
	 */
	public void basic() {
		String customer = RequestUtil.getParam(getRequest(), "customer", "");
		if (customer.trim().length()==0)
			customer = getSession().getAttribute(Const.SESSIONCUSTOMER)==null?"":(String)getSession().getAttribute(Const.SESSIONCUSTOMER);
		getSession().setAttribute(Const.SESSIONCUSTOMER, customer);
		
		setAttr("customer", customer);
		if (customer.length() > 0) {
			Record bean = Customer.get(customer, Const.INDUSTRY);
			setAttr("bean", bean);
		}
		renderFreeMarker("/WEB-INF/views/admin/rating/basic.ftl");
	}
	
	/**
	 * 财务数据
	 */
	public void financeData() {
		String customer = RequestUtil.getParam(getRequest(), "customer", "");
		int reportPeriod = RequestUtil.getParam(getRequest(), "reportPeriod", 3);  //1.最新报表   2.3月内报表  3.更久报表
		int statementType = RequestUtil.getParam(getRequest(), "statementType", 408001000);
		if (customer.trim().length()==0)
			customer = (String)getSession().getAttribute("sessioncustomer");
		getSession().setAttribute("sessioncustomer", customer);
		
		if (customer.length() > 0) {
			Record bean = Customer.get(customer, Const.INDUSTRY);
			setAttr("bean", bean);
			setAttr("debug",true); //测试用
			setAttr("customer", customer); //公司名称
			setAttr("reportPeriod", reportPeriod); 
			setAttr("statementType", statementType); 
			
			List<Record> list = BondBalanceSheet.queryFinanceData(reportPeriod, statementType, customer);
			List<MorrisLine> morrisLineList = new ArrayList<MorrisLine>();
			for (Record record : list) {
				morrisLineList.add(new MorrisLine((DateUtil.formatShortDate(record.getDate("date"))), record.getBigDecimal("d1").doubleValue(), record.getBigDecimal("d2").doubleValue()));
			}
			setAttr("json",JSON.toJSONString(morrisLineList));
		}
		renderFreeMarker("/WEB-INF/views/admin/rating/finance_data.ftl");
	}
	
	/**
	 * 财务分析
	 */
	public void financeAnalysis() {
		String customer = RequestUtil.getParam(getRequest(), "customer", "");
		int reportPeriod = RequestUtil.getParam(getRequest(), "reportPeriod", 3);  //1.最新报表   2.3月内报表  3.更久报表
		int statementType = RequestUtil.getParam(getRequest(), "statementType", 408001000);
		
		if (customer.trim().length()==0)
			customer = (String)getSession().getAttribute("sessioncustomer");
		getSession().setAttribute("sessioncustomer", customer);
		
		if (customer.length() > 0) {
			Record bean = Customer.get(customer, Const.INDUSTRY);
			setAttr("bean", bean);
			setAttr("reportPeriod", reportPeriod); 
			setAttr("statementType", statementType); 
			setAttr("list", BondBalanceSheet.queryFinanceAnalysis(reportPeriod, statementType, customer));
		}

		setAttr("customer", customer);
		renderFreeMarker("/WEB-INF/views/admin/rating/finance_analysis.ftl");
	}
	
	/**
	 * 评分
	 */
	public void rating() {
		String customer = RequestUtil.getParam(getRequest(), "customer", "");
		int reportPeriod = RequestUtil.getParam(getRequest(), "reportPeriod", 3); //1.最新报表   2.3月内报表  3.更久报表
		int statementType = RequestUtil.getParam(getRequest(), "statementType", 0);
		if (customer.trim().length()==0)
			customer = (String)getSession().getAttribute("sessioncustomer");
		getSession().setAttribute("sessioncustomer", customer);
		
		if (customer.length() > 0) {
			int length = customer.length();
			
			/* 经营效率 */
			List<RatingModel> list1 = new ArrayList<RatingModel>();
			list1.add(new RatingModel("管理费用率", 3, 10, 15, false));
			list1.add(new RatingModel("销售债券周转次数", 15, 5, 3, true));
			list1.add(new RatingModel("存货周转次数", 5, 2, 1.3, true));
			list1.add(new RatingModel("总资产周转次数", 0.8, 0.4, 0.2, true));
			List<RatingModel> result1 = new ArrayList<RatingModel>();
			for (int i=0; i<list1.size(); i++) {
				RatingModel rm = list1.get(i);
				double value = (length%10*0.1*rm.getMax()<=rm.getMin())?rm.getMin():(length%10*0.1*rm.getMax());
				double score = 0;
				System.out.println("=========================");
				System.out.println(rm.getName());
				if (!rm.isFlag()) {
					score = (rm.getMin()-value)*100/rm.getMin();
					System.out.println("max:"+rm.getMax());
					System.out.println("min:"+rm.getMin());
					System.out.println("value:"+value);
					System.out.println("(rm.getMin()-value):"+(rm.getMin()-value));
					System.out.println("score:"+(rm.getMin()-value)*100/rm.getMin());
					
				} else {
					score = value*100/rm.getMax();
				}
				rm.setValue(value);
				rm.setScore(score);
				System.out.println("toString():"+rm.toString());
				result1.add(rm);
			}
			setAttr("list1", result1);
			for (RatingModel rm : list1) {
				System.out.println(rm.toString());
			}
			
			
			/* 盈利能力  */
			List<RatingModel> list2 = new ArrayList<RatingModel>();
			list2.add(new RatingModel("营业利润率", 10, 2.5, 1, true));
			list2.add(new RatingModel("总资本收益率", 30D, 10, 5, true));
			list2.add(new RatingModel("净资本收益率", 7.5, 40, 55, false));
			List<RatingModel> result2 = new ArrayList<RatingModel>();
			for (int i=0; i<list2.size(); i++) {
				RatingModel rm = list2.get(i);
				double value = (length%10*0.1*rm.getMax()<=rm.getMin())?rm.getMin():(length%10*0.1*rm.getMax());
				double score = 0;
				if (!rm.isFlag()) {
					score = (rm.getMin()-value)*100/rm.getMin();
				} else {
					score = value*100/rm.getMax();
				}
				rm.setValue(value);
				rm.setScore(score);
				result2.add(rm);
			}
			setAttr("list2", result2);
			
			/* 财务能力  */
			List<RatingModel> list3 = new ArrayList<RatingModel>();
			list3.add(new RatingModel("长期债务资本化比率（%）", 7.5, 40, 55, false));
			list3.add(new RatingModel("全部债务资本化比率（%）", 15, 50, 60, false));
			list3.add(new RatingModel("资产负债率（%）",20, 50, 80, false));
			List<RatingModel> result3 = new ArrayList<RatingModel>();
			for (int i=0; i<list3.size(); i++) {
				RatingModel rm = list3.get(i);
				double value = (length%10*0.1*rm.getMax()<=rm.getMin())?rm.getMin():(length%10*0.1*rm.getMax());
				double score = 0;
				if (!rm.isFlag()) {
					score = (rm.getMin()-value)*100/rm.getMin();
				} else {
					score = value*100/rm.getMax();
				}
				rm.setValue(value);
				rm.setScore(score);
				result3.add(rm);
			}
			setAttr("list3", result3);
			Record bean = Customer.get(customer, Const.INDUSTRY);
			setAttr("reportPeriod", reportPeriod); 
			setAttr("statementType", statementType); 
			setAttr("bean", bean);
		}

		setAttr("customer", customer);
		renderFreeMarker("/WEB-INF/views/admin/rating/rating.ftl");
	}
	
	
	public static void main(String[] args) {
		int length = "中国交通建设股份有限公司".length();
		List<RatingModel> list1 = new ArrayList<RatingModel>();
		list1.add(new RatingModel("经营效率-管理费用率", 15D, 10D, 3D, true));
		list1.add(new RatingModel("经营效率-销售债券周转次数", 3D, 5, 15D, false));
		list1.add(new RatingModel("经营效率-存货周转次数", 5D, 2D, 1.3, true));
		list1.add(new RatingModel("经营效率-总资产周转次数", 0.8, 0.4, 0.2, true));
		
		System.out.println(length%10*0.1);
		
		for (int i=0; i<list1.size(); i++) {
			double value = length%10*0.1*list1.get(i).getMax();
			double score = length%10*0.1*list1.get(i).getMax()/list1.get(i).getMax();
			System.out.println(list1.get(i).getName()+" value:"+value+" score:"+score);
		}
	}
}
