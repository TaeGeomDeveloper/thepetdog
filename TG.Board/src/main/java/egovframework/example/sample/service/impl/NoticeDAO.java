package egovframework.example.sample.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.NoticeVO;
import egovframework.example.sample.service.PageInfoVO;
import egovframework.example.sample.service.PatVO;
import egovframework.example.sample.service.SampleVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("NoticeDAO")
public class NoticeDAO extends EgovAbstractDAO{

	public List<?> SelectAllList(NoticeVO vo) {
		return (List<?>) list("noticeDAO.SelectAllList",vo); 
	}
	
	public List<?> getBoardList(PageInfoVO paging) {
		// ex) 현재페이지 5, 한 페이지에 보여질 게시글 수 10개
        // 5 - 1 = 4,
        // 4 * 10 = 40
        int offset = (paging.getCurrentPage() - 1) * paging.getBoardLimit();
        
        //RowBounds rowBounds = new RowBounds(offset, paging.getBoardLimit());
        int page = (paging.getCurrentPage() - 1) * 10;
        // 확인용
        System.out.println("page  : " + page);
        // sqlSession.selectList()의 return값이 List<T>이기 때문에 
        // (ArrayList)로 다운캐스팅 형변환을 해주어야 한다.
        //sqlSession.selectList("BoardMapper.selectBoardList", null, rowBounds);
        return (List<?>) list("noticeDAO.SelectList", page);
    }

	
	public NoticeVO selectOneBoard(String nb_seq) throws Exception {
		return (NoticeVO) select("noticeDAO.selectOneNoticeBySeq", nb_seq);
	}
	
	public boolean insertBoard(NoticeVO notice) {
		boolean flag = false;
		int affectedCount = (int) insert("noticeDAO.insertNotice", notice); 
		return flag;
	}
	
	public boolean update(NoticeVO notice) {
		boolean flag = false;
		update("noticeDAO.updateNotice", notice);
		//int affectedCount = sqlSession.update("noticeDAO.updateNotice", notice);
		/*if (affectedCount > 0) {
			System.out.println("DAO update성공");
		} else {
			System.out.println("DAO update실패");
		}*/
		return flag;
	}
	
	public boolean deleteOne(String nb_seq) {
        boolean flag = false;
        delete("noticeDAO.deleteOneNotice", nb_seq);
        /*if(affectedCount>0) {
            flag = true;
        }*/
        return flag;
    }
	
}