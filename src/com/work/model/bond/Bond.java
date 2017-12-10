package com.work.model.bond;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

/**
 * 债券市场信息 model
 * @author crazyinsomnia
 *
 */
public class Bond extends Model<Bond>{

	private static final long serialVersionUID = 8397379474186028313L;
	
	public static final Bond dao = new Bond();
	
	public static final String TABLE = "lh_bondInfo";
    
    public boolean add(Bond bond) {
    	return bond.save();
    }
    
    @SuppressWarnings("unchecked")
	public Record get(String id) {
		return Db.findFirst("SELECT * FROM "+TABLE+" WHERE S_INFO_WINDCODE='"+id+"'");
	}
    
    
    public int del(String id) {
    	return Db.update("DELETE FROM "+TABLE+" WHERE S_INFO_WINDCODE='"+id+"'");
    }
    
	public static List<Record> list(int page, int size) {
    	String sql = "SELECT TOP " + size+ " * FROM "+TABLE+" WHERE S_INFO_WINDCODE NOT IN (SELECT TOP "+(page-1)*size+" S_INFO_WINDCODE FROM "+TABLE+")";
    	return Db.find(sql);
    }
	
	public static List<Record> list(int page, int size, String name, String code) {
    	String query = "";
    	if (name.length() > 0)
    		query += " AND B_INFO_FULLNAME='"+name+"'";
    	if (code.length() > 0)
    		query += " AND S_INFO_WINDCODE='"+code+"'";
    	String sql = "SELECT TOP " + size+ " * FROM "+TABLE+" WHERE 1=1 "+query+" AND S_INFO_WINDCODE NOT IN (SELECT TOP "+(page-1)*size+" S_INFO_WINDCODE FROM "+TABLE+" WHERE 1=1 "+query+")";
    	return Db.find(sql);
    }
	 
	public static int total() {
    	return Db.queryInt("SELECT count(S_INFO_WINDCODE) FROM "+TABLE);
    }
	
	public static int total(String binfofullname, String sinfowindcode) {
    	String sql = "SELECT count(S_INFO_WINDCODE) FROM "+TABLE+" WHERE 1=1";
		if (binfofullname.length() > 0)
			sql += " AND B_INFO_FULLNAME='"+binfofullname+"'";
    	if (sinfowindcode.length() > 0)
    		sql += " AND S_INFO_WINDCODE='"+sinfowindcode+"'";
    
    	return Db.queryInt(sql);
    }
    
    public static List<Record> list() {
    	return Db.find("SELECT * FROM "+TABLE+" ");
    }


}
