package egovframework.example.sample.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.NoticeVO;
import egovframework.example.sample.service.PageInfoVO;
import egovframework.example.sample.service.noticeBoardService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/*
	작성자 : 윤태검
	내용 : BoardController
	
*/

@Controller
@RequestMapping("/Notice")
public class BoardController {
	private static Logger Logger = LoggerFactory.getLogger(BoardController.class);
	
	
	@Resource(name="BoardService")
	private BoardService boardService;
	
	@RequestMapping(value="/boardList.do")
	public String selectDeptList(BoardVO vo, Model model) throws Exception {
		Logger.debug("deptList......sdfsdfsdfsdfsdfsdfiojwioerjsodijdfijsdio...........");
		List<?> list = boardService.SelectBoardList(vo);
		
		System.out.println(list);

		model.addAttribute("list",list);
		return "board/boardList";
	}


	// 썸머노트
 	@Resource(name="noticeBoardService")
 	private noticeBoardService noticeBoardService;
 	
 	// < 게시글 작성 > 
 	@RequestMapping(value="/createBoard.do" ,method = { RequestMethod.POST})
     //public ModelAndView createBoard(@RequestParam("nb_attachedFile") MultipartFile attachFile, HttpServletRequest request, HttpServletResponse response) throws Exception {
     public ModelAndView createBoard( 
    		 final MultipartHttpServletRequest multiRequest, HttpServletRequest request ) throws Exception {
     	//MultipartFile attachFile 
     	 ModelAndView mav = new ModelAndView();
         NoticeVO notice = new NoticeVO();
         boolean flag = false;
         
         String nb_id = request.getParameter("nb_id");
         String nb_name = request.getParameter("nb_name");
         String nb_title = request.getParameter("nb_title");
         String nb_content = request.getParameter("nb_content");
         
         notice.setNb_id(nb_id);
         notice.setNb_name(nb_name);
         notice.setNb_title(nb_title);
         notice.setNb_content(nb_content);
         
         //System.out.println("이름 : "+notice.getNb_name());
         //System.out.println("파일 : "+multiRequest.getFile("nb_attachedFile"));
         MultipartFile attachFile  = multiRequest.getFile("nb_attachedFile");
         
         try {
             flag = noticeBoardService.createBoard(notice, attachFile);
         } catch (Exception e) {
             throw new RuntimeException(e);
         }
         if(flag) {
             System.out.println("게시글 생성 완료");
         }
         //mav.setViewName("Main");
         mav.setViewName("redirect:/Notice.do");
         return mav;
     }
	
 	// < 게시글 내용 > 
 	  @RequestMapping(value="/ReadBoard.do", method=RequestMethod.GET)
 	    public ModelAndView readBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
 	        ModelAndView mav = new ModelAndView();
 	        String nb_seq = request.getParameter("nb_seq");
 	        boolean flag = false;
 	        //flag = noticeBoardService.readCount(nb_seq);
 	        NoticeVO notice = noticeBoardService.readBoard(nb_seq);
 	        mav.addObject("notice", notice);
 	        mav.setViewName("NoticeRead");
 	        return mav;
 	    }
 	  
 	// < 게시글 첨부파일 다운 > 
 	 @RequestMapping(value="/download.do", method=RequestMethod.GET)
     public ModelAndView download(HttpServletRequest request, HttpServletResponse response) throws Exception {
         ModelAndView mav = new ModelAndView();
         String nb_seq = request.getParameter("nb_seq");
         String token = request.getParameter("token");
         try {
             boolean flag = noticeBoardService.boardDownload(response, nb_seq, token);
         } catch (IOException e) {
             throw new RuntimeException(e);
         }
         
         String now = request.getServletPath();
         mav.setViewName(now);
         return mav;
     }
 	
 	 // < 게시글 수정페이지 이동 >
 	@RequestMapping(value="/viewUpdatePage.do", method=RequestMethod.GET)
    public ModelAndView viewUpdate(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception {
        ModelAndView mav = new ModelAndView();
        String nb_seq = request.getParameter("nb_seq");
        NoticeVO notice = noticeBoardService.readBoard(nb_seq);
        mav.addObject("notice", notice);
        mav.setViewName("NoticeUpdate");
        return mav;
    }
 	
 	 // < 게시글 수정 >
 	 @RequestMapping(value="/updateBoard.do", method={RequestMethod.GET, RequestMethod.POST})
     public ModelAndView updateBoard(
    		 final MultipartHttpServletRequest multiRequest, HttpServletRequest request) {
    		 //@RequestParam("nb_attachedFile") MultipartFile attachFile, HttpServletRequest request, HttpServletResponse response) {
         ModelAndView mav = new ModelAndView();
         NoticeVO notice = new NoticeVO();
         boolean flag = false;
         notice.setNb_seq(Integer.parseInt(request.getParameter("nb_seq")));
         notice.setNb_title(request.getParameter("nb_title"));
         notice.setNb_content(request.getParameter("nb_content"));
         
         MultipartFile attachFile  = multiRequest.getFile("nb_attachedFile");
         
         try {
             flag = noticeBoardService.updateBoard(notice, attachFile);
         } catch (Exception e) {
             throw new RuntimeException(e);
         }
         if(flag) {
             System.out.println("게시글 수정 완료");
         }
         mav.setViewName("redirect:./ReadBoard.do?nb_seq=" + notice.getNb_seq());
         return mav;
     }
 	
 	// < 게시글 삭제 >
 	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
    public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String nb_seq = request.getParameter("nb_seq");
        boolean flag = false;
        flag = noticeBoardService.deleteBoard(nb_seq);
       
        mav.setViewName("redirect:/Notice.do");
        return mav;
    }
 	
 	// < MAV >
    private String getViewName(HttpServletRequest request) throws Exception {
        String contextPath = request.getContextPath();
        String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
        if (uri == null || uri.trim().equals("")) {
            uri = request.getRequestURI();
        }

        int begin = 0; //
        if (!((contextPath == null) || ("".equals(contextPath)))) {
            begin = contextPath.length();
        }

        int end;
        if (uri.indexOf(";") != -1) {
            end = uri.indexOf(";");
        } else if (uri.indexOf("?") != -1) {
            end = uri.indexOf("?");
        } else {
            end = uri.length();
        }


        String fileName = uri.substring(begin, end);
        if (fileName.indexOf(".") != -1) {
            fileName = fileName.substring(0, fileName.lastIndexOf("."));
        }
        if (fileName.lastIndexOf("/") != -1) {
            fileName = fileName.substring(fileName.lastIndexOf("/"), fileName.length());
        }
        return fileName;
    }

	
}