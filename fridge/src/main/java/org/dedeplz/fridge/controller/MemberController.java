package org.dedeplz.fridge.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.dedeplz.fridge.model.MemberService;
import org.dedeplz.fridge.model.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class MemberController {
   @Resource
   private MemberService memberService;
   
   @RequestMapping("home.do")
   public String home(){
	   return "home";
   }
   
   @RequestMapping("member_registerForm.do")
   public ModelAndView registerForm(){	
		return new ModelAndView("member_register_form","memberVO",new MemberVO());
   }
   
   @RequestMapping("member_loginForm.do")
   public String loginForm(){
      return "member_login_form";
   }
   @RequestMapping("member_myPage.do")
   public String myPageList(){
	   return "member_mypage";
   }
   @RequestMapping("member_updateMemberForm.do")
   public ModelAndView updateForm(){
	   System.out.println("멤버 업데이트");
	   return new ModelAndView("member_update_check_form");
	   //return new ModelAndView("member_update_form","memberVO",new MemberVO());
   }
   
   
   
   @RequestMapping(value="member_register.do",method=RequestMethod.POST)
	public ModelAndView register(@Valid MemberVO vo,BindingResult result){
		if(result.hasErrors()){
			return new ModelAndView("member_register_form"); 
		}
		  memberService.registerMember(vo);
		   return new ModelAndView("redirect:regiResult.do?id="+vo.getId());
	}
   @RequestMapping("regiResult.do")
   public ModelAndView regiResult(HttpServletRequest request, 
			HttpServletResponse response,MemberVO vo){
		MemberVO mvo = memberService.findById(vo.getId());
		return new ModelAndView("member_register_result","mvo",mvo);
	}

	@RequestMapping("member_memberIdCheck.do")
	@ResponseBody
	public String idcheckAjax(HttpServletRequest request) {		
		String id=request.getParameter("id");
		return memberService.idCheck(id);
	}
	
	@RequestMapping("member_login.do")
	   public String login(MemberVO vo,HttpServletRequest request){
	      MemberVO mvo=memberService.login(vo);
	      if(mvo==null)
	         return "member_login_fail";
	      else{
	         HttpSession session=request.getSession();
	         session.setAttribute("mvo", mvo);
	         return "member_login_ok";
	      }      
	   }
	   
	   @RequestMapping("member_logout.do")
	   public String logout(HttpServletRequest request){
	      HttpSession session=request.getSession(false);
	      if(session!=null)
	         session.invalidate();
	      return "home";
	   }   
	  
	   
	   @RequestMapping("member_update.do")
	   public ModelAndView updateMember(@Valid MemberVO vo,BindingResult result,HttpServletRequest request, HttpSession session){
		   System.out.println("update1");
		   if(result.hasErrors()){
				return new ModelAndView("member_update_form"); 
			}
		   MemberVO vo1 = (MemberVO) session.getAttribute("mvo");
		   System.out.println(vo1);
		   vo.setId(vo1.getId());
		   memberService.updateMember(vo);
		  session.setAttribute("mvo", vo);
		   System.out.println("update2");
		return new ModelAndView("member_mypage");
	   }
	   
	 /*  @RequestMapping("member_updateMemberForm.do")
	   public String updateMemberForm() {
	      return "member_update_check_form";
	   }*/
	 
	   @RequestMapping("member_passwordCheck_update.do")
	   public ModelAndView passwordCheckUpdate(MemberVO vo) {
	      System.out.println(vo.getPassword());
	      System.out.println(vo.getId());
	      MemberVO mvo = memberService.login(vo);
	      if (mvo == null) {
	         return new ModelAndView("member_password_check_fail");
	      } else{
	         return new ModelAndView("member_update_form","memberVO",new MemberVO());
	   }
	   }
	
	
	
	
	
	
	
	
	
   
}