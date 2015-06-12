package org.dedeplz.fridge.model;

import java.util.List;

public interface MemberService {

	public  MemberVO findById(String id);
	
	public void registerMember(MemberVO vo);
	
	public String idCheck(String id);
	
	public MemberVO login(MemberVO vo);

	public void updateMember(MemberVO vo);

	public void deleteMember(MemberVO vo);

	public String nickCheck(String nick);

	public String findMyPassword(MemberVO vo);

	public String findMyId(MemberVO vo);
}