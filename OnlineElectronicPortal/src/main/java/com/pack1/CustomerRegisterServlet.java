package com.pack1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/creg")
public class CustomerRegisterServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		CustomerBean cb=new CustomerBean();
		
		cb.setUsername(req.getParameter("uname"));
		cb.setPassword(req.getParameter("pwd"));
		cb.setFname(req.getParameter("fname"));
		cb.setLname(req.getParameter("lname"));
		cb.setAddress(req.getParameter("addr"));
		cb.setMid(req.getParameter("mid"));
		cb.setMobno(req.getParameter("phno"));
		
		CustomerRegisterDAO dao=new CustomerRegisterDAO();
		int rowCount=dao.insertData(cb);
		
		if(rowCount>0)
		{
			req.setAttribute("msg","Register Successfully!!!");
			req.getRequestDispatcher("CustomerRegister.jsp").forward(req, res);
		}
		else
		{
			req.setAttribute("msg","Register Failed!!!");
			req.getRequestDispatcher("CustomerRegister.html").forward(req, res);
		}
		
	}
}
