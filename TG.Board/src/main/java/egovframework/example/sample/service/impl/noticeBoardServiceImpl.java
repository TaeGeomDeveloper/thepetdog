package egovframework.example.sample.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import org.springframework.web.multipart.MultipartFile;
import egovframework.example.sample.service.NoticeVO;
import egovframework.example.sample.service.PageInfoVO;
import egovframework.example.sample.service.PatVO;
import egovframework.example.sample.service.noticeBoardService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("noticeBoardService")
public class noticeBoardServiceImpl extends EgovAbstractServiceImpl implements noticeBoardService{

	@Resource(name="NoticeDAO")
	private NoticeDAO noticeDAO;
	
	@Override
	public List<?> SelectAllList(NoticeVO vo) throws Exception {
		return noticeDAO.SelectAllList(vo);
	}
	
	@Override
	public List<?> getBoardList(PageInfoVO paging) {
		return noticeDAO.getBoardList(paging);
	}
	
	// 읽기
	public NoticeVO readBoard(String nb_seq) throws Exception {
        NoticeVO board = new NoticeVO();
        board = noticeDAO.selectOneBoard(nb_seq);
        return board;
    }
	
	// 생성
	 public boolean createBoard(NoticeVO notice, MultipartFile attachFile) throws Exception {
	        boolean flag = false;
	        if(attachFile.isEmpty()) {
	            flag = noticeDAO.insertBoard(notice);
	        } else {
	            HashMap<String, String> fileNameMap = upload(attachFile);
	            notice.setNb_originFileName(fileNameMap.get("originFileName"));
	            notice.setNb_serverFileName(fileNameMap.get("serverFileName"));
	            flag = noticeDAO.insertBoard(notice);
	        }
	        return flag;
	    }
	 
	 // 수정
	 public boolean updateBoard(NoticeVO notice, MultipartFile attachFile) throws Exception {
	        boolean flag = false;
	        if(attachFile.isEmpty()) {
	            flag = noticeDAO.update(notice);
	        } else {
	            HashMap<String, String> fileNameMap = upload(attachFile);
	            notice.setNb_originFileName(fileNameMap.get("originFileName"));
	            notice.setNb_serverFileName(fileNameMap.get("serverFileName"));
	            flag = noticeDAO.update(notice);
	        }
	        return flag;
	    }
	 
	 // 삭제
	 public boolean deleteBoard(String nb_seq) {
	        boolean flag = false;
	        flag = noticeDAO.deleteOne(nb_seq);
	        return flag;
	}
	 
	 // 첨부파일
	 public HashMap<String, String> upload(MultipartFile attachFile) {
	        HashMap<String, String> fileNameMap = new HashMap<>();
	        //원래파일명과 서버파일명
	        String originFileName = "";
	        String serverFileName = "";
	        // 디렉토리 생성
	        //String baseDir = "D:\\Upload";
	        //String baseDir = "/home/ubuntu/dev/Upload";
	        String baseDir = "/alf6292/tomcat/file";
	        //날짜관련
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	        String today = formatter.format(new java.util.Date());
	        String year = today.substring(0,4);
	        String month = today.substring(4,6);
	        String rootUploadDir = baseDir + File.separator + year + File.separator + month;
	        File dir = new File(rootUploadDir);
	        if(!dir.exists()) {
	            dir.mkdirs();
	        }
	        //원래파일명 넣기
	        originFileName = attachFile.getOriginalFilename();
	        //업로드된 파일명 = 업로드시간 + 랜덤파일명 + 확장자
	        serverFileName = today + "-" + UUID.randomUUID().toString().substring(0,13) + originFileName.substring(originFileName.lastIndexOf("."));
	        //업로드
	        File saveFile = new File(rootUploadDir + File.separator + serverFileName);
	        try {
	            attachFile.transferTo(saveFile);
	        } catch (IOException e) {
	            throw new RuntimeException(e);
	        }
	        fileNameMap.put("originFileName", originFileName);
	        fileNameMap.put("serverFileName", serverFileName);
	        return fileNameMap;
	    }
	 
	 // 다운로드
	 public boolean boardDownload(HttpServletResponse response, String cb_seq, String token) throws Exception {
	        boolean flag = false;
	        //게시판 정보 레코드 얻기
	        NoticeVO board = noticeDAO.selectOneBoard(cb_seq);
	        String originFileName = board.getNb_originFileName();
	        String serverFileName = board.getNb_serverFileName(); 
	        //본래파일명 한글처리
	        originFileName = new String(originFileName.getBytes("UTF-8"), "ISO-8859-1");
	        //게시판 첨부파일 경로지정
	        //String baseDir = "D:\\Upload";
	        //String baseDir = "/home/ubuntu/dev/Upload";
	        String baseDir = "/alf6292/tomcat/file";
	        String year = serverFileName.substring(0,4);
	        String month = serverFileName.substring(4,6);
	        String rootDownloadDir = baseDir + File.separator + year + File.separator + month + File.separator;
	        File download = new File(rootDownloadDir+serverFileName);
	        
	        //다운로드 설정
	        response.setContentType("text/html; charset=UTF-8");
	        response.setHeader("Cache-Control", "no-cache;");
	        response.addHeader("Content-Disposition", "attachment;filename="+originFileName);
	        response.setHeader("Content-Transfer-Encoding", "binary");
	        response.setHeader("Content-Type", "application/octet-stream");
	        response.setHeader("Expires", "-1;");
	        
	        //다운로드
	        FileInputStream fis = new FileInputStream(download);
	        OutputStream os = response.getOutputStream();
	        byte[] buffer = new byte[256];
	        int len = 0;
	        while((len=fis.read(buffer))!=-1) {
	            os.write(buffer, 0, len);
	        }
	        //flag = noticeDAO.updateDownloadCount(cb_seq, token);
	        os.close();
	        fis.close();
	        return flag;
	    }
	 
}