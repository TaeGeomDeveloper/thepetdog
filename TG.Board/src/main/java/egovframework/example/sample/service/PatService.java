package egovframework.example.sample.service;

import java.util.List;

public interface PatService {
	public List<?> SelectPatList(PatVO vo) throws Exception;
	
	int InsertPatList(PatVO vo) throws Exception;
	
	void updatePatList(PatVO vo) throws Exception;
	
	public boolean deletePatList(int pno);
}