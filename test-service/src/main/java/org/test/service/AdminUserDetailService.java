package org.test.service;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
@Service
public class AdminUserDetailService implements UserDetailsService{
	
	public static String adminName;
	public static String adminPwd;
	public static String getAdminPwd() {
		return adminPwd;
	}

	public static void setAdminPwd(String adminPwd) {
		AdminUserDetailService.adminPwd = adminPwd;
	}

	public static String getAdminName() {
		return adminName;
	}

	public static void setAdminName(String adminName) {
		AdminUserDetailService.adminName = adminName;
	}

	/**
	 * 实现UserDetailsService接口返回设定的登录名密码
	 */
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		if(username.equals(adminName)){//账户一
			return DEFAULT_USER;
		}
		return null;
	}

	
	private static UserDetails DEFAULT_USER=new UserDetails() {
		/**
		 * serialVersionUID
		 */
		private static final long serialVersionUID = 6171858642458578117L;

		@Override
		public boolean isEnabled() {
			return true;
		}
		@Override
		public boolean isCredentialsNonExpired() {
			return true;
		}
		
		@Override
		public boolean isAccountNonLocked() {
			return true;
		}
		
		@Override
		public boolean isAccountNonExpired() {
			return true;
		}
		
		@Override
		public String getUsername() {
			return adminName;
		}
		
		@Override
		public String getPassword() {
			return adminPwd;
		}
		
		@Override
		public Collection<? extends GrantedAuthority> getAuthorities() {
			return null;
		}
	};
	
}
