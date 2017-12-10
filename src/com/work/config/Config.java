package com.work.config;

import java.util.Properties;


import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.dialect.AnsiSqlDialect;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.FreeMarkerRender;
import com.jfinal.render.ViewType;
import com.work.controller.AuthController;
import com.work.controller.admin.bond.BondController;
import com.work.controller.admin.cp.CpController;
import com.work.controller.admin.customer.CustomerController;
import com.work.controller.admin.project.ProjectController;
import com.work.controller.admin.rating.RatingController;
import com.work.interceptor.AuthInterceptor;
import com.work.model.bond.Bond;
import com.work.model.customer.Customer;
import com.work.model.auth.Employee;
import com.work.model.project.Project;

public class Config  extends JFinalConfig {
	private final static Properties properties = new Properties();
    private final static Properties properties2 = new Properties();
    private final String freemarkerProperties = "/freemarker.properties";
    private final String toolProperties = "/toolbox.properties";

	@Override
	public void configConstant(Constants me) {
		me.setDevMode(true);
		me.setViewType(ViewType.FREE_MARKER);
		me.setBaseViewPath("/WEB-INF/views");
        try {
            properties.load(Config.class.getResourceAsStream(freemarkerProperties));
            properties2.load(Config.class.getResourceAsStream(toolProperties));

            FreeMarkerRender.setProperties(properties);

            for (Object key : properties2.keySet()) {
                FreeMarkerRender.getConfiguration().setSharedVariable(key.toString(),
                        Class.forName(properties2.getProperty(key.toString())).newInstance());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	@Override
	public void configHandler(Handlers me) {
		
	}

	@Override
	public void configInterceptor(Interceptors me) {
		me.add(new AuthInterceptor());
	}

	/**
	 * 配置各类插件
	 */
	@Override
	public void configPlugin(Plugins me) {
		loadPropertyFile("config.properties");

		String jdbcUrl = getProperty("jdbcurl");
        String username = getProperty("username");
        String password = getProperty("password");
        String driverClass = getProperty("driverClass");
        C3p0Plugin c3p0Plugin = new C3p0Plugin(jdbcUrl, username, password,driverClass);
        me.add(c3p0Plugin);
        ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
        arp.setDialect(new AnsiSqlDialect());
        arp.setShowSql(true);
        
        arp.addMapping("lh_project", Project.class);
        arp.addMapping("lh_customer", Customer.class);
        arp.addMapping("lh_employee", Employee.class);
        arp.addMapping("lh_bondInfo","S_INFO_WINDCODE", Bond.class);
        

        me.add(arp);
	}

	/**
	 * 配置访问路径
	 */
	@Override
	public void configRoute(Routes me) {

		me.add("/auth", AuthController.class);
		
		me.add("/admin/cp/cp", CpController.class);
		me.add("/admin/project/project", ProjectController.class);
		me.add("/admin/customer/customer", CustomerController.class);
		me.add("/admin/bond/bond", BondController.class);
		me.add("/admin/rating", RatingController.class);
	}

}
