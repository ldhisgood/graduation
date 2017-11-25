package com.qykh.frame.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qykh.core.domain.TUser;

public class LoginFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	/**
	 * 拦截没有登录的用户
	 */
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
			HttpServletRequest request = (HttpServletRequest) arg0;
			String uri = request.getRequestURI();
			//是不是登录请求
			if(!(uri.contains("login")||uri.contains("Login"))){
				HttpSession session = request.getSession();
				TUser user = (TUser) session.getAttribute("user");
				if(user==null){
					HttpServletResponse response = (HttpServletResponse) arg1;
					String path = request.getContextPath()+"/retLogin.html";
					response.sendRedirect(path);
					return ;
				}
			}
			arg2.doFilter(arg0, arg1);
			return ;
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
