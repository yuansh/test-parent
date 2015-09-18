package org.test.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.test.common.entity.Member;
import org.test.common.vo.MemberVo;
import org.test.service.MemberService;

/**
 * MemberController 后台会员管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value="/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/memberManage",method=RequestMethod.GET)
	public String noticManage(){
		return "/member/memberManagement";
	}
	@RequestMapping("/memberList")
	@ResponseBody
	public Page<Member> memberList(MemberVo membervo) {
		return memberService.queryList(membervo);
	}
	
}
