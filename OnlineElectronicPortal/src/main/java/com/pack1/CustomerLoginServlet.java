package com.pack1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/clogin")
public class CustomerLoginServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		CustomerBean cb=new CustomerLoginDAO().check_Login(req.getParameter("uname"),req.getParameter("pwd"));
		if(cb==null)
		{
			req.setAttribute("msg","Invalid Login credentials");
			req.getRequestDispatcher("CustomerLogin.html").forward(req, res);
		}
		else
		{
			HttpSession session=req.getSession();
			session.setAttribute("cbean",cb);
			req.getRequestDispatcher("CustomerHome.jsp").forward(req, res);
		}
	}
}
