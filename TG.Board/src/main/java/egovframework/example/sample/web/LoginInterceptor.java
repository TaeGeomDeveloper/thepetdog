package egovframework.example.sample.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/*
 * 로그인 인터셉트 구현
 * 
 * 작성자 : 윤태검
 * 
 * 작성일 : 2023. 07. 10 (월)
 * */

public class LoginInterceptor implements HandlerInterceptor {
	
	// preHandle
	// 컨트롤러 실행 전, 즉 컨트롤러 request 들어가기전에 수행 한다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		System.out.println("[preHandle]" + id);
		
		// 만약 로그인하지 않았다면 로그인 페이지로 redirect
		if(id == null) {
			String urlPrior = request.getRequestURI().toString() + "?" + request.getQueryString();
			request.getSession().setAttribute("url_prior_login", urlPrior); // 직전 URL을 세션에 기록.
			
			response.sendRedirect(request.getContextPath() + "loginPage.do");
			return false;
		}
		
		return true;
	}
	
	// PostHandle
	// 컨트롤러 실행하고 나서 뷰 실행전, 즉 컨트롤러의 핸들러 처리가 끝나 return 되고, 뷰화면을 response 되기직전에 postHandle 메서드를 수행한다.
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mav) throws Exception {
		System.out.println("[postHandle]");
		//HandlerInterceptor.super.postHandle(request, response, handler, mav);
	}
	
	// afterCompletion
	// 뷰 화면을 response 끝난뒤에 수행한다.
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		System.out.println("[afterCompletion]");
		//HandlerInterceptor.super.afterCompletion(request, response, handler, mav);
	}
	
}
