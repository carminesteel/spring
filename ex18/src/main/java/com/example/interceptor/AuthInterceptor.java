package com.example.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (request.getSession().getAttribute("id") == null) {
			String path=request.getServletPath();
			String query=request.getQueryString();
			if(query !=null) {
				query = "?"+query;
			}else {
				query = "";
			}
			if(path!="/user/login") {
				request.getSession().setAttribute("dest", path + query);
			}else {
				request.getSession().setAttribute("dest", "list");
			}
			
			
			System.out.println(path + query);
			response.sendRedirect("/user/login");
		}
		return super.preHandle(request, response, handler);
	}
}
