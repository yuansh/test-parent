package org.test.dao;

import org.springframework.stereotype.Repository;
import org.test.common.entity.Member;

@Repository
public interface MemberDao   extends  BaseDao<Member, Long> {
	public Member findByName(String name);

	public Member findByEmail(String useremail);
}
