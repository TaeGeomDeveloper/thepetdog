package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.memberService;
import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.MemberVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("memberService")
public class memberServiceImpl extends EgovAbstractServiceImpl implements memberService{

	@Resource(name="memberDAO")
	private memberDAO memberDAO;
	
	@Override
	public List<?> SelectMemberList(MemberVO vo) throws Exception {
		return memberDAO.SelectMemberList(vo);
	}
	
	public boolean isMemberId(String mi_id) {
		boolean flag = false;
        flag = memberDAO.isSameId(mi_id);
        return flag;
	};

	public boolean insertOneMember(MemberVO vo) {
		boolean flag = false;
        flag = memberDAO.insertOneMember(vo);
        return flag;
	};
	
	public MemberVO login (MemberVO memberVO) throws Exception{
		return memberDAO.loginById(memberVO);
	}
	
	public MemberVO checkMember (String mi_id, String mi_password) throws Exception{
		return memberDAO.checkMember(mi_id, mi_password);
	}
	
}