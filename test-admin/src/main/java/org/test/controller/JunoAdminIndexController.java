package org.test.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author SZX
 * @description 后端
 */

@Controller
@RequestMapping(value = "/")
public class JunoAdminIndexController {	
	
	@RequestMapping(value = "")
	public String index(){
		return "/index";
	}
	
	@RequestMapping(value = "welcome")
	public String welcome(){
		return "/welcome";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "errorMsg", required = false) Long errorMsg, Model model) {
		if (null != errorMsg && errorMsg == 1)
			model.addAttribute("errorMsg", "亲爱的用户，您输入的用户名或密码不正确，请重新输入。");
		return "/login";
	}	

}
