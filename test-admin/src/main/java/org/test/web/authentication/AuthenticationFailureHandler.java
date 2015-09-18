package org.test.web.authentication;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

public class AuthenticationFailureHandler  extends SimpleUrlAuthenticationFailureHandler{
@Override
public void onAuthenticationFailure(HttpServletRequest request,
		HttpServletResponse response, AuthenticationException exception)
		throws IOException, ServletException {
	HttpSession session=request.getSession();
	int times = 0;// 记录失败登录次数
	 
	if ((Integer) session.getAttribute("loginFailureTimes") != null) {
		times = (Integer) session.getAttribute("loginFailureTimes");
		logger.info("当前用户已经登录失败" + times + "次");
	}
	long lastLoginTime=new Date().getTime();// 记录上次登录时间
	if ((Long) request.getSession().getAttribute("lastLoginTime") != null) {
		lastLoginTime = (Long) request.getSession().getAttribute("lastLoginTime");
	}
	if ((new Date().getTime() - lastLoginTime) > 24 * 60 * 60 * 1000) {
		logger.info("当前用户距离上次登录时间已经超过24小时");
		times=0;
	}
	times++;
	session.setAttribute("loginFailureTimes", times);
	session.setAttribute("lastLoginTime", new Date().getTime());
	
	super.onAuthenticationFailure(request, response, exception);
}
}
