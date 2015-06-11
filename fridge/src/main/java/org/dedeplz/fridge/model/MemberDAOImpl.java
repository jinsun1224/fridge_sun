package org.dedeplz.fridge.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	/* (non-Javadoc)
	 * @see org.dedeplz.fridge.model.MemberDAO#allMember()
	 */
	@Override
	public MemberVO findById(String id){
		return sqlSessionTemplate.selectOne("member.findById",id);
	}
	@Override
	public void registerMember(MemberVO vo) {
		sqlSessionTemplate.insert("member.registerMember",vo);
		
	}
	
	public String idCheck(String id) {
		int count=sqlSessionTemplate.selectOne("member.idCheck",id);
		return (count==0) ? "ok":"fail"; 		
	}
	
	@Override
	   public MemberVO login(MemberVO vo) {
	      return sqlSessionTemplate.selectOne("member.login",vo);
	   }
	@Override
	public void updateMember(MemberVO vo) {
		System.out.println("updateDAOImpl");
		System.out.println("update"+vo);
		sqlSessionTemplate.update("member.updateMember",vo);
		
	}

}
