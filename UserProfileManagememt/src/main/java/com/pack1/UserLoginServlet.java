package com.pack1;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class UserLoginServlet  extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		UserLoginDAO ul_dao=new UserLoginDAO();
		UserBean bean=ul_dao.checkLogin(req.getParameter("uname"),req.getParameter("upwd"));
		if(bean==null)
		{
			req.setAttribute("msg","Invalid credentials");
			req.getRequestDispatcher("Register.jsp").forward(req, res);
		}
		else
		{
			ServletContext context=req.getServletContext();
			context.setAttribute("ubean", bean);
			Cookie ck=new Cookie("ckname",bean.getUser_name());
			res.addCookie(ck);
			req.getRequestDispatcher("Home.jsp").forward(req, res);
			
		}
	
	}
}
