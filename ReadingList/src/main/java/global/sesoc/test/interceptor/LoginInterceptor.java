package global.sesoc.test.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 로그인 여부 확인
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		
		// 로그인을 안했으면 로그인 화면으로 리다이렉트
		if(loginId == null) {
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath+"/login");
			return false;
		}
		
		// 로그인을 했으면 true, 
		return true;
	}

}
