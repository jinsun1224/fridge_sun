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

}