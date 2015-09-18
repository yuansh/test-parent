package org.test.web.authentication;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;

public class UserLogoutHandler extends SecurityContextLogoutHandler {
	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
		if (authentication != null && null != authentication.getPrincipal()) {
//			Member member = memberService.findOne(((Member)authentication.getPrincipal()).getId());
//			member.setIsOnline(OnLineState.OFF_LINE);
//			memberService.modify(member);
		}
		super.logout(request, response, authentication);

	}
}
