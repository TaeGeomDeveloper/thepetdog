package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.PatService;
import egovframework.example.sample.service.PatVO;
import egovframework.example.sample.service.SampleVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("PatService")
public class PatServiceImpl extends EgovAbstractServiceImpl implements PatService{

	@Resource(name="PatDAO")
	private PatDAO patDAO;
	
	@Override
	public List<?> SelectPatList(PatVO vo) throws Exception {
		return patDAO.SelectPatList(vo);
	}
	
	// 입력
	@Override
	public int InsertPatList(PatVO vo) throws Exception {

		return patDAO.insertPatList(vo);
	}
	
	// 수정
	@Override
	public void updatePatList(PatVO vo) throws Exception {
		patDAO.updatePatList(vo);
	}

	//삭제
	@Override
	public boolean deletePatList(int pno) {
		boolean flag = false;
        flag = patDAO.deletePat(pno);
        return flag;
	};
	
}