package com.work.model.cp;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

/**
 * 客户信息model
 * @author crazyinsomnia
 *
 */
public class Cp extends Model<Cp>{

	private static final long serialVersionUID = 8397379474186028313L;
	public static final String TABLE = "lh_customer";
	public static final Cp dao = new Cp();
    
    public boolean add(Cp cp) {
    	return cp.save();
    }
    @SuppressWarnings("unchecked")
	public Cp get(String id) {
		return dao.findById(id);
	}
    
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
    	return Db.find("SELECT * FROM lh_customer ORDER BY founDate DESC ");
    }
    
    public Record getRecord(String id) {
    	return Db.findById(TABLE, id);
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
