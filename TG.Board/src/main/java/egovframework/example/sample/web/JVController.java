package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.GET;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.MemberVO;
import egovframework.example.sample.service.PatService;
import egovframework.example.sample.service.PatVO;
import egovframework.example.sample.service.memberService;
import egovframework.rte.fdl.property.EgovPropertyService;

/*
 *  @author 윤태검
 * 	2023.07.07
 */

@Controller
@RequestMapping("/JVC")
public class JVController {
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	

	@GetMapping(value = "/test.do")
	public String selectExampleList(ModelMap model) {
		model.addAttribute("test", "1234");
		return "jsonView";
	}
	
	// 회원정보
	@Resource(name="memberService")
	private memberService memService;
	
	@GetMapping(value = "/GetMembers.do")
	public String GetMembers(MemberVO vo, Model model) throws Exception {
		List<?> list = memService.SelectMemberList(vo);
		
		model.addAttribute("list",list);
		return "jsonView";
	}
	
	// 게시글
	@Resource(name="BoardService")
	private BoardService boardService;
	
	@RequestMapping(value="/GetboardList.do")
	public String selectDeptList(BoardVO vo, Model model) throws Exception {
		List<?> list = boardService.SelectBoardList(vo);
		//System.out.println(list);

		model.addAttribute("list",list);
		return "jsonView";
	}

	// 애완동물 
	@Resource(name="PatService")
	private PatService patService;

	@RequestMapping(value = "/GetPatList.do")
	public String selectPatList(HttpServletRequest request, PatVO vo, Model model) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO mem = (MemberVO) session.getAttribute("member"); 
		vo.setM_id(mem.getId());
		//System.out.println(vo.getM_id());
		List<?> list = patService.SelectPatList(vo);
		// System.out.println(list);
		

		model.addAttribute("list", list);
		return "jsonView";
	}

	// 애완동물 추가
/*	@ResponseBody
	@RequestMapping(value = "/AddPat.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String InsertPatList(@RequestBody PatVO vo) throws Exception {
		//System.out.println("서비스 실행");
		patService.InsertPatList(vo);
		// System.out.println(list);
		
		return "jsonView";
	}*/
	
	/*// 애완동물 추가
	@RequestMapping(value = "/AddPat.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String InsertPatList(@RequestParam("name") String name, @RequestParam("age") int age,  @RequestParam("classification") String classification, @RequestParam("m_id") String m_id) throws Exception {
		PatVO vo = new PatVO(name,age,classification,m_id);
		patService.InsertPatList(vo);
		
		return "jsonView";
	}*/
	// 애완동물 수정
	@RequestMapping(value = "/UpdatePat.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String UpdatePatList(@RequestParam("pno") int pno, @RequestParam("name") String name, @RequestParam("age") int age,  @RequestParam("classification") String classification) throws Exception {
		PatVO vo = new PatVO(pno,name,age,classification);
		patService.updatePatList(vo);
		
		return "jsonView";
	}
	// 애완동물 삭제
	@RequestMapping(value = "/DeletePat.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String deletePatList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int pno = Integer.parseInt(request.getParameter("pno"));
		System.out.println(pno);
        patService.deletePatList(pno);
	
		return "PatList";
	}
	
	
	// 애완동물 추가 V2
	@RequestMapping(value = "/sendList.do", method = { RequestMethod.POST, RequestMethod.GET })
	//public String InsertPetList(@RequestBody List<PatVO> list) throws Exception {
	public String InsertPetList(@RequestBody List<PatVO> petList) throws Exception {
		
		//patService.InsertPatList(petList);
		
		for(int i = 0; i < petList.size(); i++) {
			//PatVO vo = new PatVO(name,age,classification,m_id);
			PatVO vo = new PatVO();
			vo = (PatVO)petList.get(i);
			System.out.println(vo);
			patService.InsertPatList(vo);
		}
		
		return "jsonView";
	}
	
	
}