package egovframework.example.sample.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.MemberVO;
import egovframework.example.sample.service.SampleVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;


@Repository("memberDAO")
public class memberDAO extends EgovAbstractDAO{
	
	public List<?> SelectMemberList(MemberVO vo) {
		return (List<?>) list("memberDAO.SelectMemberList",vo);
	}
	
	//id 중복확인
	public boolean isSameId(String mi_id) {
		boolean flag = false;
		int affectedCount = (Integer) select("memberDAO.selectListTotCnt", mi_id);
		if(affectedCount>0){
			flag = true;
		}
		return flag;
	}
	
	//회원 등록 기능
	public boolean insertOneMember(MemberVO vo) {
		boolean flag = false;
		insert("memberDAO.insertMember", vo);
 
		return flag;
	}
	
	// 로그인
	public MemberVO loginById(MemberVO vo) throws Exception {
		return (MemberVO) select("memberDAO.SelectOneMemberList", vo);
	}
	
	//로그인 할 때 회원인지 체크
	public MemberVO checkMember(String mi_id, String mi_password) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("mi_id", mi_id);
		map.put("mi_password", mi_password);
		System.out.println(" DAO 실행 : " + map);
		return (MemberVO) select("memberDAO.checkMember", map);
		//return (MemberVO) select("memberDAO.checkMember", mi_id, mi_password);
	}
	
}