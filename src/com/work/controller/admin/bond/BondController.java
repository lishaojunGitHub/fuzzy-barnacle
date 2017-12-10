package com.work.controller.admin.bond;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Record;
import com.work.bean.Result;
import com.work.model.bond.Bond;
import com.work.util.Const;
import com.work.util.DateUtil;
import com.work.util.RequestUtil;


/**
 * 债券信息管理
 * @author crazyinsomnia
 *
 */
public class BondController extends Controller {
	
	public void list() {
		int page = RequestUtil.getParam(getRequest(), "page", 1);
		int pageSize = RequestUtil.getParam(getRequest(), "pageSize", Const.SIZE);
		String name = RequestUtil.getParam(getRequest(), "name", "");
		String code= RequestUtil.getParam(getRequest(), "code", "");
		String begindate = RequestUtil.getParam(getRequest(), "begindate", DateUtil.getYesterday());
		String enddate = RequestUtil.getParam(getRequest(), "enddate", DateUtil.getYesterday());
		

		setAttr("name",name);
		setAttr("code",code);
		setAttr("begindate", begindate);
		setAttr("enddate", enddate);
		setAttr("list", Bond.list(page, pageSize,name,code));
		setAttr("total", Bond.total(name,code));
		setAttr("page", page);
		setAttr("pageSize", pageSize);
		renderFreeMarker("/WEB-INF/views/admin/bond/bond_list.ftl");
	}
	
	public void add() {
		setAttr("action","add");
		renderFreeMarker("/WEB-INF/views/admin/bond/bond_add.ftl");
	}
	
	public void edit() {
		String id = RequestUtil.getParam(getRequest(), "id", "");
		Record record = Bond.dao.get(id);
		setAttr("bean", record);
		setAttr("action","edit");
		renderFreeMarker("/WEB-INF/views/admin/bond/bond_add.ftl");
	}
	
	public void detail() {
		String id = RequestUtil.getParam(getRequest(), "id", "");
		Record record = Bond.dao.get(id);
		setAttr("bean", record);
		setAttr("action","detail");
		renderFreeMarker("/WEB-INF/views/admin/bond/bond_detail.ftl");
	}
	
	public void save() {
		Bond bond = getModel(Bond.class, "bond");
        if (bond.getStr("S_INFO_WINDCODE")!=null && bond.getStr("S_INFO_WINDCODE").length()>0) {
        	bond.update();
        } else {
        	
        	bond.set("S_INFO_WINDCODE", new Const().getAutoId(1)).save();
        	
        }
        redirect("/admin/bond/bond/list");
	}
	
	public void delete() {
		String id = RequestUtil.getParam(getRequest(), "id", "");
		Bond.dao.del(id);
		renderJson(new Result(1, "成功"));
	}
}
