package com.work.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.work.model.auth.Employee;
import com.work.util.Const;

public class AuthInterceptor implements Interceptor{

	@Override
	public void intercept(ActionInvocation ai) {
		String actionKey = ai.getActionKey();
        Employee employee = ai.getController().getSessionAttr(Const.SESSIONEMPLOYEE);
        if (employee != null) {
            ai.getController().setAttr(Const.SESSIONEMPLOYEE, employee);
            ai.getController().setAttr(Const.SESSIONUSER, employee.getStr("username"));
        }
        if (actionKey.startsWith("/admin/") && employee == null) {
            ai.getController().redirect("/auth/login");
        } else {
        	ai.invoke();
        }
		
	}

}
