package org.test.dao;

import org.springframework.data.domain.AuditorAware;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.test.common.constants.JunoConstants;
import org.test.common.entity.Member;
@Component
public class SpringSecurityAuditorAware implements AuditorAware<Long>{

	@Override
	public Long getCurrentAuditor() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		if (authentication == null)
			return JunoConstants.SYSTEM_ID;
		
		if (authentication.getPrincipal().equals(JunoConstants.ANONYMOUS_USER))
			return JunoConstants.ANONYMOUS_ID;
		
		if(authentication.getPrincipal() instanceof Member)
			return ((Member) authentication.getPrincipal()).getId();
		
		
		return JunoConstants.SYSTEM_ID;
	}

}
