package com.work.controller.admin.project;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Record;
import com.work.bean.Result;
import com.work.model.project.Project;
import com.work.util.RequestUtil;
import com.work.util.Const;
import com.work.util.DateUtil;

/**
 * 项目管理
 * @author crazyinsomnia
 *
 */
public class ProjectController extends Controller {
	
	public void list() {
		int page = RequestUtil.getParam(getRequest(), "page", 1);
		int pageSize = RequestUtil.getParam(getRequest(), "pageSize", Const.SIZE);
		String name = RequestUtil.getParam(getRequest(), "name", "");
		String code = RequestUtil.getParam(getRequest(), "code", "");
		String begindate = RequestUtil.getParam(getRequest(), "begindate", DateUtil.getYesterday());
		String enddate = RequestUtil.getParam(getRequest(), "enddate", DateUtil.getYesterday());
		
		setAttr("list", Project.list(page, pageSize,name,code));
		setAttr("total", Project.total(name,code));
		setAttr("name",name);
		setAttr("code",code);
		setAttr("page", page);
		setAttr("pageSize", pageSize);
		setAttr("begindate", begindate);
		setAttr("enddate", enddate);
		renderFreeMarker("/WEB-INF/views/admin/project/project_list.ftl");
	}
	
	public void add() {
		setAttr("action","add");
		renderFreeMarker("/WEB-INF/views/admin/project/project_add.ftl");
	}
	
	public void edit() {
		String id = RequestUtil.getParam(getRequest(), "id", "");
		Record record = Project.dao.getRecord(id);
		setAttr("bean", record);
		setAttr("action","edit");
		renderFreeMarker("/WEB-INF/views/admin/project/project_add.ftl");
	}
	public void detail() {
		String id = RequestUtil.getParam(getRequest(), "id", "");
		Record record = Project.dao.getRecord(id);
		setAttr("bean", record);
		setAttr("action","detail");
		renderFreeMarker("/WEB-INF/views/admin/project/project_detail.ftl");
	}
	
	public void save() {
		Project project = getModel(Project.class, "project");
        if (project.getStr("id")!=null && project.getStr("id").length()>0) {
        	project.update();
        } else {
        	project.set("id", new Const().getAutoId(1)).save();
        }
        redirect("/admin/project/project/list");
	}
	
	
	
	public void delete() {
		String id = RequestUtil.getParam(getRequest(), "id", "");
		Project.dao.deleteById(id);
		renderJson(new Result(1, "成功"));
	}
}
