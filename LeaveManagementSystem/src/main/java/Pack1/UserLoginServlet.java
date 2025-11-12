package Pack1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
			UserLoginDAO dao=new UserLoginDAO();
			UserBean bean=dao.checkLogin(req.getParameter("name"),req.getParameter("password"));
			
			if(bean==null)
			{
				req.setAttribute("msg","Invalid Username & Password");
				req.getRequestDispatcher("reg.jsp").forward(req, res);
			}
			else
			{
				Cookie ck = new Cookie("username", bean.getName());
				Cookie ckRole = new Cookie("role", bean.getRole());
                ck.setMaxAge(3600); // 1 hour
                res.addCookie(ck);
                res.addCookie(ckRole);

                if ("admin".equalsIgnoreCase(bean.getRole())) {
                    res.sendRedirect("adminHome.jsp");
                } else {
                    res.sendRedirect("userHome.jsp");
			}
			}
		}
		
		
	}

