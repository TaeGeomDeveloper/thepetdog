package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.PatVO;
import egovframework.example.sample.service.SampleVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;


@Repository("PatDAO")
public class PatDAO extends EgovAbstractDAO{

	public List<?> SelectPatList(PatVO vo) {
		return (List<?>) list("patDAO.SelectPatList",vo); 
	}
	
	public int insertPatList(PatVO vo) throws Exception {
		
		return  (int) insert("patDAO.insertPatList", vo);
	}
	
	public void updatePatList(PatVO vo) throws Exception {
		update("patDAO.updatePatList", vo);
	}
	
	//삭제
	public boolean deletePat(int pno) {
		boolean flag = false;
		int affectedCount = (Integer) delete("patDAO.deletePatList", pno);
		if (affectedCount > 0) {
			flag = true;
		}
		return flag;
	}
}