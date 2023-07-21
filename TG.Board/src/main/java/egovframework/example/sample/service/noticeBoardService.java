package egovframework.example.sample.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public interface noticeBoardService {
	
	public List<?> SelectAllList(NoticeVO vo) throws Exception;
	
	public boolean createBoard(NoticeVO notice, MultipartFile attachFile) throws Exception;
	
	public boolean updateBoard(NoticeVO notice, MultipartFile attachFile) throws Exception;
	
	public boolean deleteBoard(String nb_seq) throws Exception;
	
	public NoticeVO readBoard(String nb_seq) throws Exception;
	
	public boolean boardDownload(HttpServletResponse response, String cb_seq, String token) throws Exception;
	
	public List<?> getBoardList(PageInfoVO paging) throws Exception;
}