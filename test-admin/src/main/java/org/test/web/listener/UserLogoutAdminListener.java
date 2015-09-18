package org.test.web.listener;

import javax.servlet.http.HttpSessionEvent;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.session.HttpSessionEventPublisher;

/**
 * 监控session失效，更新用户在线状态
 * @author Administrator
 *
 */
public class UserLogoutAdminListener extends HttpSessionEventPublisher{
		@Override
		public void sessionCreated(HttpSessionEvent event) {
			super.sessionCreated(event);
		}
		
		@Override
		public void sessionDestroyed(HttpSessionEvent event) {
				UserDetails user=(UserDetails)event.getSession().getAttribute("user");
				if(null!=user){
					
				}
				super.sessionDestroyed(event);
			}
}
