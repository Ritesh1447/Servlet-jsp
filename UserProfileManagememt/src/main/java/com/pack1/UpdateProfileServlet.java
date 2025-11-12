package com.pack1;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/update")
public class UpdateProfileServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException ,IOException
	{
		Cookie arr[]=req.getCookies();
		String fname=null;
		if(arr==null)
		{
			req.setAttribute("msg", "Session is expired");
			req.getRequestDispatcher("Register.jsp").forward(req, res);
		}
		else
		{
			ServletContext context=req.getServletContext();
			UserBean ub=(UserBean)context.getAttribute("ubean");
			
			ub.setUser_fname(req.getParameter("ufname"));
			ub.setUser_lname(req.getParameter("ulname"));
			ub.setUser_mail(req.getParameter("umail"));
			ub.setUser_phone(req.getParameter("uphone"));
			
			int rowCount=new UpdateProfileDAO().updateData(ub);
			if(rowCount>0)
			{
				req.setAttribute("msg","Profile Updated!!! ");
				for(Cookie ck:arr)
				{
					if("ckname".equals(ck.getName()))
					{
						fname=ck.getValue();
					}
				}
				req.setAttribute("fname",fname);
				req.getRequestDispatcher("UpdateProfile.jsp").forward(req, res);
			}
			else
			{
				throw new RuntimeException("There is a technical issue in updating the data!!!");
			}
		}
	}
}
