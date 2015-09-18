package org.test.interceptor;

import java.lang.reflect.Method;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.test.annotation.AvoidDuplicateSubmission;
import org.test.annotation.TokenAction;

public class AvoidDuplicateSubmissionInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		if(handler instanceof HandlerMethod){
			HandlerMethod handlerMethod=(HandlerMethod)handler;
			Method method=handlerMethod.getMethod();
			AvoidDuplicateSubmission annotation=method.getAnnotation(AvoidDuplicateSubmission.class);
				if(null!=annotation){
					TokenAction tokenAction=annotation.tokenAction();
					if(tokenAction==TokenAction.PREPARATION){
						request.getSession().setAttribute("token", UUID.randomUUID());
					}else if(tokenAction==TokenAction.SUBMIT){
						String token=(String)request.getSession().getAttribute("token");
						request.getSession().removeAttribute("token");
						if(!(token != null && token.equals(request.getParameter("token")) && !"".equals(annotation.dupUrl()))){
							response.sendRedirect(request.getContextPath()+ annotation.dupUrl());
							return false;
						}
					}
				}
			return true;
		}
		
		return super.preHandle(request, response, handler);
	}
	
}
