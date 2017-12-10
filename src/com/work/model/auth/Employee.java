package com.work.model.auth;


import com.itc.utils.StringUtils;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

public class Employee extends Model<Employee>{

	private static final long serialVersionUID = 8397379474186028313L;
	
	public static final Employee dao = new Employee();
	
	public static final String TABLE = "lh_employee";
    
    public static boolean checkExist(String username) {
        Record record = Db.findFirst("SELECT id FROM "+TABLE+" WHERE username=?", StringUtils.escapeSQL(username));
        return record==null?false:true;
    }
	
	public static String getPassword(String username) {
		return Db.queryStr("SELECT password FROM "+TABLE+" WHERE username=?",StringUtils.escapeSQL(username));
	}
	
	public static Employee getUserByNameAndPwd(String email, String password) {
        return Employee.dao.findFirst("SELECT * FROM "+TABLE+" WHERE username=? AND password=?",
                StringUtils.escapeSQL(email), StringUtils.escapeSQL(password));
    }

}
