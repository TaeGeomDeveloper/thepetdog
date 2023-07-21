package egovframework.example.sample.service;

import java.util.List;

import javax.annotation.Resource;

import egovframework.example.sample.service.impl.memberDAO;

public interface memberService {
	public List<?> SelectMemberList(MemberVO vo) throws Exception;
	
	public boolean isMemberId(String mi_id);
	
	public boolean insertOneMember(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
	
	public MemberVO checkMember(String mi_id, String mi_password) throws Exception;
}
