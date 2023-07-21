package egovframework.example.sample.service;
import java.sql.Timestamp;
import java.util.Date;

/**
 * @Class Name : NoticeVO.java
 * @Description : NoticeVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2023.07.12    윤태검       최초생성
 *
 * @author 윤태검
 * @since 2023. 07.12
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PageInfoVO {

	 private int currentPage; // 현재 페이지
	 private int listCount;   // 총 게시글의 수 [ SELECT COUNT(*) FROM BOARD ]
	 private int pageLimit;   // 한 페이지에 보여질 페이징 수 ex) 총 페이지가 13개면, 1 ~ 10 / 11 ~ 13
	 private int maxPage;     // 총 페이지    (1 ~ 50)
	 private int startPage;   // 시작 페이지  (1    11    21    31    41)
	 private int endPage;     // 끝 페이지    (10    20    30    40    50)
	    
	 private int boardLimit;
	
	 
	 
	 

}
