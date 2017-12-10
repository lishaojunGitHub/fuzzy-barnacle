package com.work.model.rateing;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.work.util.DateUtil;

public class BondBalanceSheet extends Model<BondBalanceSheet> {

	private static final long serialVersionUID = 3455707333016281646L;
	
	public static final BondBalanceSheet dao = new BondBalanceSheet();
	
	
	/**
	 * 
	 * @param reportPeriod 报告期
	 * @param statementType  报告类型
	 * @param compCode 公司ID
	 * @return
	 */
	public static List<Record> queryFinanceData(int reportPeriod, int statementType, String compCode,int aa) {
		String sql = "SELECT DISTINCT ROUND(TOT_CUR_ASSETS/10000,2) d1,ROUND(TOT_NON_CUR_ASSETS/10000,2) d2,REPORT_PERIOD,STATEMENT_TYPE,S_INFO_NAME,S_INFO_WINDCODE , CONVERT(datetime, [REPORT_PERIOD]) as date FROM lh_CBONDBALANCESHEET a, lh_bondInfo b WHERE a.S_INFO_COMPCODE=b.ISSUER_CODE";
		if (compCode.trim().length() > 0)
			sql += " AND S_INFO_COMPCODE='"+compCode+"'";
		if (statementType > 0)
			sql += " AND STATEMENT_TYPE="+statementType;
		if (reportPeriod == 1)
			sql += " AND CONVERT(datetime, [REPORT_PERIOD])>="+DateUtil.getBeforeDate(-30);
		else if (reportPeriod == 2)
			sql += " AND CONVERT(datetime, [REPORT_PERIOD])>="+DateUtil.getBeforeDate(-90);
		else if (reportPeriod == 3) 
			sql += " AND CONVERT(datetime, [REPORT_PERIOD])<"+DateUtil.getBeforeDate(-90);
		
		return Db.find(sql);
	}
	
	/**
	 * 财务数据
	 * @param reportPeriod 报告期
	 * @param statementType  报告类型
	 * @param compCode 公司ID
	 * @return
	 */
	public static List<Record> queryFinanceData(int reportPeriod, int statementType, String companyName) {
		String sql = "SELECT DISTINCT ROUND(TOT_CUR_ASSETS/10000,2) d1,ROUND(TOT_NON_CUR_ASSETS/10000,2) d2,REPORT_PERIOD,STATEMENT_TYPE,S_INFO_NAME,S_INFO_WINDCODE , CONVERT(datetime, [REPORT_PERIOD]) as date FROM lh_CBONDBALANCESHEET a, lh_bondInfo b WHERE a.S_INFO_COMPCODE=b.ISSUER_CODE";
		if (companyName.trim().length() > 0)
			sql += " AND ISSUER_NAME='"+companyName+"'";
		if (statementType > 0)
			sql += " AND STATEMENT_TYPE="+statementType;
		if (reportPeriod == 1)
			sql += " AND CONVERT(datetime, [REPORT_PERIOD])>='"+DateUtil.getBeforeDate(-30)+"'";
		else if (reportPeriod == 2)
			sql += " AND CONVERT(datetime, [REPORT_PERIOD])>='"+DateUtil.getBeforeDate(-90)+"'";
		else if (reportPeriod == 3) 
			sql += " AND CONVERT(datetime, [REPORT_PERIOD])<'"+DateUtil.getBeforeDate(-90)+"'";
		
		return Db.find(sql);
	}
	
	/**
	 * 财务分析方法
	 * @param reportPeriod
	 * @param statementType
	 * @param crncyCode
	 * @return
	 */
	public static List<Record> queryFinanceAnalysis(int reportPeriod, int statementType, String companyName ) {
		String sql = "SELECT DISTINCT ROUND(TOT_CUR_ASSETS/10000,2) TOT_CUR_ASSETS,CONVERT(datetime, [REPORT_PERIOD]) as date "
				+ " FROM lh_CBONDBALANCESHEET a, lh_bondInfo b WHERE a.S_INFO_COMPCODE=b.ISSUER_CODE AND month(CONVERT(datetime, [REPORT_PERIOD]))=12";
		if (companyName.trim().length() > 0)
			sql += " AND ISSUER_NAME='"+companyName+"'";
		if (statementType > 0)
			sql += " AND STATEMENT_TYPE="+statementType;
		if (reportPeriod == 1)
			sql += " AND CONVERT(datetime, [REPORT_PERIOD])>='"+DateUtil.getBeforeDate(-30)+"'";
		else if (reportPeriod == 2)
			sql += " AND CONVERT(datetime, [REPORT_PERIOD])>='"+DateUtil.getBeforeDate(-90)+"'";
		else if (reportPeriod == 3) 
			sql += " AND CONVERT(datetime, [REPORT_PERIOD])<'"+DateUtil.getBeforeDate(-90)+"'";
		return Db.find(sql);
	}

}
