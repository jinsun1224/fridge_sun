package org.dedeplz.fridge.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	 @Resource
	private MemberDAO memberDAO;
	 /* (non-Javadoc)
	 * @see org.dedeplz.fridge.model.MemberService#allMember()
	*/
	public MemberVO findById(String id) {
		// TODO Auto-generated method stub
		return memberDAO.findById(id);
	}
	@Override
	public void registerMember(MemberVO vo) {
		memberDAO.registerMember(vo);		
	}
	@Override
	public String idCheck(String id) {
		return memberDAO.idCheck(id);
	}
	 @Override
	   public MemberVO login(MemberVO vo) {
	      return memberDAO.login(vo);
	   }
	@Override
	public void updateMember(MemberVO vo) {
		System.out.println("updateServiceImpl");
		memberDAO.updateMember(vo);
	}
	   @Override
	   public void deleteMember(MemberVO vo) {
	      memberDAO.deleteMember(vo);
	   }
	@Override
	public String nickCheck(String nick) {
		return memberDAO.nickCheck(nick);
	}
	   @Override
	   public String findMyId(MemberVO vo) {
	      return memberDAO.findMyId(vo);
	   }
	@Override
	public String findMyPassword(MemberVO vo) {
		return memberDAO.findMyPassword(vo);
	}
	@Override
	public ListVO getMemberList(String pageNo) {
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		List<MemberVO> list=memberDAO.getMemberList(pageNo);
		int total=memberDAO.totalContent();
		PagingBean paging=new PagingBean(total,Integer.parseInt(pageNo));
		ListVO lvo=new ListVO(list,paging);
		return lvo;
	}
	@Override
	public void levelChange(MemberVO vo) {
		memberDAO.levelChange(vo);
		
	}

}
