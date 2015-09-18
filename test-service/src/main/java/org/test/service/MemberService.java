package org.test.service;


import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.test.common.entity.Member;
import org.test.common.vo.MemberVo;
import org.test.dao.MemberDao;

/**
 * InformationService 后台会员管理Service 2015年1月15日 上午10:09:59
 * 
 */

@Service
@Transactional
public class MemberService {
	@SuppressWarnings("unused")
	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private MemberDao memberDao;
	@Autowired
	private PasswordEncoder bcryptEncoder;
	@Value("${system.code}")
	private String systemCode; 
	@Value("${system.mars.code}")
	private String marsCode;
	@Value("${http.url}")
	private String url;
	/**
	 * 修改会员信息
	 * 
	 * @author XieZG
	 * @Date:2015年4月23日上午11:11:38
	 * @param member
	 */
	public void modify(Member member) {
		memberDao.save(member);
	}

	/**
	 * 根据名字查询会员
	 * 
	 * @author XieZG
	 * @Date:2015年4月23日上午11:12:01
	 * @param username
	 * @return
	 */
	public Member queryUsername(String username) {
		return memberDao.findByName(username);
	}

	/**
	 * 根据邮箱查询会员
	 * 
	 * @author yuansh
	 * @Date:2015年5月04日上午10:10:01
	 * @param useremail
	 * @return
	 */
	public Member queryUseremail(String useremail) {
		return memberDao.findByEmail(useremail);
	}



	/**
	 * 根据用户的id查询用户的信息
	 * 
	 * @param id
	 * @return
	 */
	public Member findOne(Long id) {
		return memberDao.findOne(id);
	}

	
	
	public Member findByName(String username) {
		return memberDao.findByName(username);
	}

	public Member findByEmail(String email) {
		return memberDao.findByEmail(email);
	}

	public Page<Member> queryList(final MemberVo membervo) {
		Page<Member> page = memberDao.findAll(new Specification<Member>() {

			@Override
			public Predicate toPredicate(Root<Member> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				List<Expression<Boolean>> expressions = predicate.getExpressions();
				if (null!=membervo&&StringUtils.isNotBlank(membervo.getqArticleTitle())) {
					expressions.add(cb.like(root.<String> get("name"), "%" + membervo.getqArticleTitle() + "%"));
				}
				query.where(predicate);
				return query.getRestriction();
			}

		}, membervo);
		return page;
	}
	
	
}
