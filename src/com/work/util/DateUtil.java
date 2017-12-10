package com.work.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {

    private static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	
	public static String getBeforeDate(int day) {
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DAY_OF_YEAR, day);
		return format.format(calendar.getTime());
	}
	
	public static String formatShortDate(Date date) {
        return format.format(date);
    }
	 
	public static String getYesterday() {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, -1);
        return format.format(cal.getTime());
	}
	
	public static void main(String[] args) {
		System.out.println(getBeforeDate(-30));
	}
}
