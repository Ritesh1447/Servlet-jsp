package Pack1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateStatus")
public class UpdateServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		StatusUpdateDAO dao=new StatusUpdateDAO();
		int rowCount=dao.updateStatus(req.getParameter("lid"), req.getParameter("status"));
		
		if(rowCount>0)
		{
			req.setAttribute("msg","Status  Updated");
			 req.getRequestDispatcher("up.jsp").forward(req, res);
		}
		else {
			req.setAttribute("msg","Status Not Updated");
			 req.getRequestDispatcher("up.jsp").forward(req, res);
		}
	}
}
