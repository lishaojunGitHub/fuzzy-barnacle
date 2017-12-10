package com.work.controller.admin.cp;


import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Record;
import com.work.bean.Result;
import com.work.model.customer.Customer;
import com.work.util.RequestUtil;
import com.work.util.Const;
import com.work.util.DateUtil;
/**
 * 客户管理
 * @author crazyinsomnia
 *
 */
public class CpController extends Controller {

	
	public void list() {
		int page = RequestUtil.getParam(getRequest(), "page", 1);
		int pageSize = RequestUtil.getParam(getRequest(), "pageSize", Const.SIZE);
		String name = RequestUtil.getParam(getRequest(), "name", "");
		String code = RequestUtil.getParam(getRequest(), "code", "");
		String property = RequestUtil.getParam(getRequest(), "property", "");
		String industry = RequestUtil.getParam(getRequest(), "industry", "");		
		String begindate = RequestUtil.getParam(getRequest(), "begindate", DateUtil.getYesterday());
		String enddate = RequestUtil.getParam(getRequest(), "enddate", DateUtil.getYesterday());
		
		setAttr("list", Customer.list(page, pageSize, name, code, property, industry));
		setAttr("total", Customer.total(name, code, property, industry));
		setAttr("page", page);
		setAttr("pageSize", pageSize);
		setAttr("name",name);
		setAttr("code",code);
		setAttr("property",property);
		setAttr("industry",industry);
		setAttr("begindate", begindate);
		setAttr("enddate", enddate);
		renderFreeMarker("/WEB-INF/views/admin/cp/cp_list.ftl");
	}
	
	public void add() {
		setAttr("action","add");
		renderFreeMarker("/WEB-INF/views/admin/cp/cp_add.ftl");
	}
	
	public void edit() {
		String id = RequestUtil.getParam(getRequest(), "id", "");
		Record record = Customer.dao.getRecord(id);
		setAttr("bean", record);
		setAttr("action","edit");
		renderFreeMarker("/WEB-INF/views/admin/cp/cp_add.ftl");
	}
	
	public void detail() {
		String id = RequestUtil.getParam(getRequest(), "id", "");
		Record record = Customer.dao.getRecord(id);
		setAttr("bean", record);
		setAttr("action","detail");
		renderFreeMarker("/WEB-INF/views/admin/cp/customer_detail.ftl");
	}
	
	public void delete() {
		String id = RequestUtil.getParam(getRequest(), "id", "");
		Customer.dao.deleteById(id);
		renderJson(new Result(1, "成功"));
	}
	
	public void save() {
		Customer customer = getModel(Customer.class, "customer");
        if (customer.getStr("id")!=null && customer.getStr("id").length()>0) {
        	customer.update();
        } else {
        	customer.set("id",  new Const().getAutoId(1)).save();
        }
        redirect("/admin/cp/cp/list");
	}
}
