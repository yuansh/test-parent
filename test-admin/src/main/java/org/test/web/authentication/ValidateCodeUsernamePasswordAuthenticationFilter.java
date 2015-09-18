package org.test.web.authentication;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

public class ValidateCodeUsernamePasswordAuthenticationFilter extends UsernamePasswordAuthenticationFilter {
	@Value("${adminName}")
	private String adminName;
	@Value("${adminPwd}")
	private String adminPwd;
	@Autowired
	private PasswordEncoder bcryptEncoder;
	@Override
	public Authentication attemptAuthentication(HttpServletRequest request,
			HttpServletResponse response) throws AuthenticationException {
		int times = 0;// 失败登录次数
		HttpSession session = request.getSession();
		if ((Integer) session.getAttribute("loginFailureTimes") != null) {
			times = (Integer) session.getAttribute("loginFailureTimes");
			logger.info("当前用户已经登录失败" + times + "次");
		}
		long lastLoginTime = new Date().getTime();// 记录上次登录时间
		if ((Long) request.getSession().getAttribute("lastLoginTime") != null) {
			lastLoginTime = (Long) request.getSession().getAttribute("lastLoginTime");
		}
		if (times>=4 && ((new Date().getTime() - lastLoginTime) <= 24 * 60 * 60 * 1000)) {
			String picCode = request.getParameter("picCode");
			if (picCode != null && picCode.equalsIgnoreCase((String) request.getSession().getAttribute("capText"))) {
				session.removeAttribute("loginVerificationCode");
			} else {
				session.setAttribute("loginFailureTimes", times);
				//if(picCode.length()>0){//验证码输入错误用于登陆页面提示
				    session.setAttribute("loginVerificationCode","failure");
				//}
				throw new AuthenticationServiceException("验证码不匹配");
			}
		}
		String userName=request.getParameter("j_username");
		if(userName!=null){
			//Member member=memberService.queryUsername(userName);
			
			if(adminName.equals(userName)){
				if(!bcryptEncoder.matches(request.getParameter("j_password"),adminName)){
					session.setAttribute("loginVerificationUserPassword","failure");
				};
				
			}else{
				session.setAttribute("loginVerificationUserName","failure");
				throw new AuthenticationServiceException("没有这个用户：["+userName+"]");
			}
		}
		
		return super.attemptAuthentication(request, response);
	}
}
