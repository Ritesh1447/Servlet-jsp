package Pack1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class UserRegisterServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		UserBean bean=new UserBean();
		
		bean.setId(req.getParameter("id"));
		bean.setName(req.getParameter("uname"));
		bean.setPassword(req.getParameter("pwd"));
		bean.setRole(req.getParameter("role"));
		
		UserRegisterDAO dao=new UserRegisterDAO();
		int rowCount=dao.insertData(bean);
		
		if(rowCount > 0) {
		    req.setAttribute("msg", "Register Successfully!!!!");
		} else {
		    req.setAttribute("msg", "Registration Failed!!");
		}
		req.getRequestDispatcher("reg.jsp").forward(req, res);

		
		
		
	}
}
