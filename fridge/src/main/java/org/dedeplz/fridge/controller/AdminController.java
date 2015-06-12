package org.dedeplz.fridge.controller;

import javax.annotation.Resource;

import org.dedeplz.fridge.model.MemberService;
import org.springframework.web.bind.annotation.RequestMapping;

public class AdminController {
	  @Resource
	   private MemberService memberService;
	  
	  @RequestMapping("adminpage.do")
	  public String showAdminPage(){
		  return "member_adminpage";
	  }

}
