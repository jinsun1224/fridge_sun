package org.dedeplz.fridge.controller;

import javax.annotation.Resource;

import org.dedeplz.fridge.model.MemberService;
import org.dedeplz.fridge.model.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class AdminController {
	  @Resource
	   private MemberService memberService;
	  
	  @RequestMapping("admin_adminpage.do")
	  public ModelAndView showAdminPage(String pageNo){
		  return new ModelAndView ("admin_adminpage","lvo",memberService.getMemberList(pageNo));
	  }
	  
	  @RequestMapping("admin_outMember.do")
	  public String outMemeber(MemberVO vo ){
//		  System.out.println("admin_delete"+vo);
		  memberService.deleteMember(vo);
		  return "redirect:admin_adminpage.do";
	  }
	  
	  
	  
	  
}
