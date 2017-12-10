package com.work.model.project;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
//import com.work.util.StringUtil;

/**
 * 项目信息Model
 * @author crazyinsomnia
 *
 */
public class Project extends Model<Project>{

	private static final long serialVersionUID = 8397379474186028313L;
	
	public static final Project dao = new Project();
	
	public static final String TABLE= "lh_project";
    
    public boolean add(Project project) {
    	return project.save();
    }
    
	@SuppressWarnings("unchecked")
	public Project get(String id) {
		return dao.findById(id);
	}
	
	public Record getRecord(String id) {
		return Db.findById(TABLE, id);
	}
    
	public static List<Record> list(int page, int size, String name, String code) {
    	String query = "";
    	if (name.length() > 0)
    		query += " AND name='"+name+"'";
    	if (code.length() > 0)
    		query += " AND code='"+code+"'";
    	
    	String sql = "SELECT TOP " + size+ " * FROM "+TABLE+" WHERE 1=1 "+query+" AND id NOT IN (SELECT TOP "+(page-1)*size+" id FROM "+TABLE+" WHERE 1=1 "+query+")";
    	return Db.find(sql);
	}
	 public static List<Record> list() {
	    	return Db.find("SELECT * FROM "+TABLE+" ");
	    }
	
	public static int total() {
    	return Db.queryInt("SELECT count(id) FROM "+TABLE);
    }
	
	
    
    public static int total(String name, String code) {
    	String sql = "SELECT count(id) FROM "+TABLE+" WHERE 1=1";
		if (name.length() > 0)
			sql += " AND name='"+name+"'";
    	if (code.length() > 0)
    		sql += " AND code='"+code+"'";
    	return Db.queryInt(sql);
    }

   
}
