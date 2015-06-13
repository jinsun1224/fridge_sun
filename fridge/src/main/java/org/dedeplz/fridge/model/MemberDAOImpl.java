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
	
	@Override
	   public void deleteMember(MemberVO vo) {
	      sqlSessionTemplate.delete("member.deleteMember",vo);
	   }
	@Override
	public String nickCheck(String nick) {
		int count=sqlSessionTemplate.selectOne("member.nickCheck",nick);
		return (count==0) ? "ok":"fail";
	}
	   @Override
	   public String findMyId(MemberVO vo) {
	      return sqlSessionTemplate.selectOne("member.findMyId",vo);
	   }
	@Override
	public String findMyPassword(MemberVO vo) {
		return sqlSessionTemplate.selectOne("member.findMyPassword", vo);
	}
	@Override
	public List<MemberVO> getMemberList(String pageNo) {
		return sqlSessionTemplate.selectList("member.getMemberList", pageNo);
	}
	@Override
	public int totalContent(){
		return sqlSessionTemplate.selectOne("member.totalContent");
	}

}
