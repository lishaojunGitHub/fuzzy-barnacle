package com.work.model.customer;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

/**
 * 发行人model
 * @author crazyinsomnia
 *
 */
public class Customer extends Model<Customer>{

	private static final long serialVersionUID = 8397379474186028313L;
	
	public static final Customer dao = new Customer();
	
	public static final String TABLE = "lh_customer";
    
    public boolean add(Customer customer) {
    	return customer.save();
    }
    
    @SuppressWarnings("unchecked")
	public Customer get(String id) {
		return dao.findById(id);
    }
    
	public Record getRecord(String id) {
		return Db.findById(TABLE, id);
	}
	
	public static Record get(String name, String industry_name3) {
		String sql = "SELECT * FROM "+TABLE+" WHERE name='"+name+"'";
		if (industry_name3.length() > 0)
			sql += " AND industry_name3='"+industry_name3+"'";
		return Db.findFirst(sql);
	}
    
	/**
	 * 
	 * @param page
	 * @param size
	 * @param name
	 * @param code
	 * @param property
	 * @param industry
	 * @return
	 */
    public static List<Record> list(int page, int size, String name, String code, String property, String industry) {
    	String query = "";
    	if (name.length() > 0)
    		query += " AND name='"+name+"'";
    	if (code.length() > 0)
    		query += " AND code='"+code+"'";
    	if (property.length() > 0)
    		query += " AND property='"+property+"'";
    	if (industry.length() > 0)
    		query += " AND industry_name2='"+industry+"'";
    	
    	String sql = "SELECT TOP " + size+ " * FROM "+TABLE+" WHERE 1=1 "+query+" AND id NOT IN (SELECT TOP "+(page-1)*size+" id FROM "+TABLE+" WHERE 1=1 "+query+")";
    	return Db.find(sql);
    }
    
    public static List<Record> list() {
    	return Db.find("SELECT * FROM "+TABLE+" ");
    }
    
    public static int total() {
    	return Db.queryInt("SELECT count(id) FROM "+TABLE);
    }
    
    public static int total(String name, String code, String property, String industry) {
    	String sql = "SELECT count(id) FROM "+TABLE+" WHERE 1=1";
		if (name.length() > 0)
			sql += " AND name='"+name+"'";
    	if (code.length() > 0)
    		sql += " AND code='"+code+"'";
    	if (property.length() > 0)
    		sql += " AND property='"+property+"'";
    	if (industry.length() > 0)
    		sql += " AND industry_name2='"+industry+"'";
    	return Db.queryInt(sql);
    }
    


}

