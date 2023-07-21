package egovframework.example.sample.web;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.MemberVO;
import egovframework.example.sample.service.NoticeVO;
import egovframework.example.sample.service.PageInfoVO;
import egovframework.example.sample.service.PatService;
import egovframework.example.sample.service.PatVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.SampleVO;
import egovframework.example.sample.service.memberService;
import egovframework.example.sample.service.noticeBoardService;
import egovframework.example.sample.service.impl.memberDAO;
/*import egovframework.example.sample.service.MemberVO;*/
import egovframework.example.sample.service.memberService;
import egovframework.example.sample.service.PatService;

@Controller
public class MainController {
	private static Logger Logger = LoggerFactory.getLogger(MainController.class);
	
	@Resource(name="memberService")
	private memberService memService;
	
	 // 썸머노트
 	@Resource(name="noticeBoardService")
 	private noticeBoardService noticeBoardService;
	
	// 메인
	@RequestMapping(value="/main.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String home(Locale locale, Model model) {
		
		return "Main";
	}
	
	// 애견 모아
	@RequestMapping(value = "/moa.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String moa(Locale locale, Model model) {

		return "moa";
	}
	
	// 썸머노트
	@RequestMapping(value = "/Summernote.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Summernote(Locale locale, Model model) {

		return "Summernote";
	}
	
	// 게시글
//	@RequestMapping(value = "/Notice.do", method = { RequestMethod.GET, RequestMethod.POST })
//	public String Notice(NoticeVO vo, Model model) throws Exception {
//		List<?> list = noticeBoardService.SelectAllList(vo);
//		
//		model.addAttribute("list",list);
//		return "Notice";
//	}
	
	// 페이징 처리
	@RequestMapping(value = "/Notice.do")
    public String Board(NoticeVO vo, Model model, 
                        @RequestParam(value="currentPage", // 태그의 name값
                                      required = false,       // 파라미터 필수 입력 여부
                                      defaultValue = "1"   // null값 → 1 [ required=true일 시, 400에러 ]
                                     )int currentPage) throws Exception {
 
        // 전체 게시글 목록
        //ArrayList<Board> boardList = service.getBoardList();
		List<?> listAll = noticeBoardService.SelectAllList(vo);
		
        // 게시글 총 갯수
		// int listCount = service.getListCount();
		int listCount = listAll.size();
		
        // 확인용
        System.out.println("총 게시글 수  : " + listCount);
        
        // 클릭한 페이지, 총 게시글 수 전달
        PageInfoVO paging = Pagination.getPageInfo(currentPage, listCount);
        
        // 게시글 목록
        List<?> list = noticeBoardService.getBoardList(paging);
        
        // JSP로 전송
        //model.addAttribute("boardList", boardList);
        model.addAttribute("list",list);
        model.addAttribute("paging", paging);
        
        return "Notice";
    }
	
	// JsonView Test
	@RequestMapping(value = "/JVC.do", method = RequestMethod.GET)
    public ModelAndView jvc(HttpServletRequest request,
                               HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
   
        mav.setViewName("jvc");
        return mav;
    }
	
	// 보드 페이지
	@Resource(name="BoardService")
	private BoardService boardService;
	
	@RequestMapping(value="/board.do")
	public String selectDeptList(BoardVO vo, Model model) throws Exception {
		Logger.debug("deptList......sdfsdfsdfsdfsdfsdfiojwioerjsodijdfijsdio...........");
		List<?> list = boardService.SelectBoardList(vo);
		
		System.out.println(list);

		model.addAttribute("list",list);
		return "board";
	}
	
	// 회원정보
	@RequestMapping(value="/myPage.do", method = RequestMethod.GET)
	public String selectDeptList(MemberVO vo, Model model) throws Exception {
		List<?> list = memService.SelectMemberList(vo);
		
		System.out.println(list);
		model.addAttribute("list",list);
		return "myPage";
	}

	// 애완동물정보
	@Resource(name="PatService")
	private PatService patService;
	
	@RequestMapping(value = "/PatList.do", method = RequestMethod.GET)
	public String selectPatList(PatVO vo, Model model) throws Exception {
		List<?> list = patService.SelectPatList(vo);

		System.out.println(list);
		model.addAttribute("list", list);
		return "PatList";
	}
	
	// 로그인 테스트
	@RequestMapping("/loging.do")
	public String updateSampleView(@RequestParam("selectedId") String id, @ModelAttribute("searchVO") SampleDefaultVO searchVO, Model model) throws Exception {
		SampleVO sampleVO = new SampleVO();
		sampleVO.setId(id);
		// 변수명은 CoC 에 따라 sampleVO
		//model.addAttribute(selectSample(sampleVO, searchVO));
		return "loging";
	}
	
	// 로그인 화면
	@RequestMapping(value="/loginPage.do", method = RequestMethod.GET)
	public String loginPage(Locale locale, Model model) {
		
		return "loginForm";
	}
	
	// 회원가입 페이지
	@RequestMapping(value="/Register.do", method = RequestMethod.GET)
	public String RegisterPage(Locale locale, Model model) {
		
		return "Register";
	}
	
	// 아이디 중복 체크
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.GET)
	public ResponseEntity<String> idCheck(@RequestParam("mi_id") String mi_id) {
	        boolean flag = false;
	        System.out.println("idCheck : " + mi_id);
	        flag = memService.isMemberId(mi_id);
	        if (mi_id == "") {
	        flag = true;
	   }
	   return new ResponseEntity<String>(String.valueOf(flag), HttpStatus.OK);
	}	
	
	// 회원가입 절차
    @RequestMapping(value = "/registProcess.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView registProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String id = request.getParameter("mi_id");
        String pwd = request.getParameter("mi_password");
        String name = request.getParameter("mi_name");
        String mi_email = request.getParameter("mi_email");
        String mi_email1 = request.getParameter("mi_email1");
        //String email = mi_email + "@" + mi_email1;
        String email = mi_email;
 
        //System.out.println(mi_email);
        //System.out.println(mi_email1);
        System.out.println(email);

        MemberVO memberVO = new MemberVO(id, pwd, name, email);

        boolean flag = false;
        flag = memService.insertOneMember(memberVO);
        mav.setViewName("Main");
        
        System.out.println(memberVO);
        
        return mav;
   }
 	
 	// < 게시글 작성 > 
 	@RequestMapping(value="/createBoard.do" ,method = { RequestMethod.POST})
     //public ModelAndView createBoard(@RequestParam("nb_attachedFile") MultipartFile attachFile, HttpServletRequest request, HttpServletResponse response) throws Exception {
     public ModelAndView createBoard( 
    		 final MultipartHttpServletRequest multiRequest, HttpServletRequest request ) throws Exception {
     	//MultipartFile attachFile 
     	 ModelAndView mav = new ModelAndView();
         NoticeVO notice = new NoticeVO();
         boolean flag = false;
         /*
         String nb_id = request.getParameter("nb_id");
         String nb_name = request.getParameter("nb_name");
         String nb_title = request.getParameter("nb_title");
         String nb_content = request.getParameter("nb_content");
         
         notice.setNb_id(nb_id);
         notice.setNb_name(nb_name);
         notice.setNb_title(nb_title);
         notice.setNb_content(nb_content);
         
         System.out.println("이름 : "+nb_name);
         */
         //MultipartFile attachFile  = request.getFile("nb_attachedFile");
         
         try {
             //flag = noticeBoardService.createBoard(notice, attachFile);
         } catch (Exception e) {
             throw new RuntimeException(e);
         }
         if(flag) {
             System.out.println("게시글 생성 완료");
         }
         mav.setViewName("Main");
         //mav.setViewName("redirect:./BoardList.do");
         return mav;
     }
    
    // 로그인 절차 1
    @RequestMapping(value = "/login.do", method = {RequestMethod.POST, RequestMethod.GET})
    public ResponseEntity<String> login(@RequestParam("mi_id") String mi_id, @RequestParam("mi_password") String mi_password,
                                               HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception {
        
    	// HttpSession Bean 주입 -> session 영역에 접근 가능.
        boolean flag = false;
        
        System.out.println("로그인 아디  : " + mi_id + "비번" + mi_password);
        MemberVO member = memService.checkMember(mi_id, mi_password);
        
        System.out.println("로그인 회원  : " + member);
        
        if (member != null) {
            flag = true;
            request.getSession().setAttribute("member", member);    // session을 생성하면서 member OBJ를 user라는 이름으로 session 영역에 던져 놓음.
            boolean session = request.isRequestedSessionIdValid();
            System.out.println("login session : " + session);
            try {
                MemberVO mem = (MemberVO) httpSession.getAttribute("user");    // session 영역에서 원하는 데이터를 가져올 수 있게 된다.
                System.out.println(mem.getId() + " 계정으로 접속되었습니다.");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        System.out.println("로그인 회원 체크 : " + flag);
        return new ResponseEntity<String>(String.valueOf(flag), HttpStatus.OK);
    }
    
    // 로그아웃
    @RequestMapping(value = "/Logout.do", method = RequestMethod.GET)
    public ModelAndView logout(HttpServletRequest request,
                               HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        request.getSession().invalidate();
   
        mav.setViewName("Main");
        return mav;
    }
 
    // 로그인 결과
    @RequestMapping(value = "/*Form.do",method = RequestMethod.GET)
    public ModelAndView form(@RequestParam(value = "result", required = false) String result,HttpServletRequest request,
    		HttpServletResponse response) throws Exception {
    	
    	String viewName = getViewName(request);
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("result",result);
    	mav.setViewName("Main");
    	
    	return mav;
    }
    
	// 보드 페이지
//		@Resource(name="BoardService")
//		private BoardService boardService;
//		
//		@RequestMapping(value="/board.do")
//		public String selectDeptList(BoardVO vo, Model model) throws Exception {
//			List<?> list = boardService.SelectBoardList(vo);
//			
//			System.out.println(list);
//
//			model.addAttribute("list",list);
//			return "board";
//		}
	
	
	/*@Resource(name="memberService")
	private memberService memberService;
	
	@RequestMapping(value = "/loging.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
			RedirectAttributes rAttr,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		MemberVO vo = memberService.login(member);
		
		if(vo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", vo);
			session.setAttribute("isLogOn", true);
			mav.setViewName("redirect:/main.do");
		} else {
			mav.setViewName("redirect:/main.do");
		}
				
		return mav;
	}*/
    
    // View 처리
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
            fileName = fileName.substring(fileName.lastIndexOf("/"));
        }
        return fileName;
    }
    
    
}