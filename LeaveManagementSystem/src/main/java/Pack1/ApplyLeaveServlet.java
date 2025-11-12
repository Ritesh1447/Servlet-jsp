package Pack1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/leave")
public class ApplyLeaveServlet extends HttpServlet
{
  protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
  {
	  LeaveBean bean=new LeaveBean();
	  
	  bean.setLeaveId(req.getParameter("lid"));
	  bean.setUsername(req.getParameter("name"));
	  bean.setFromdate(req.getParameter("fdate"));
	  bean.setTo_date(req.getParameter("tdate"));
	  bean.setReason(req.getParameter("reason"));
	  
	  ApplyLeaveDAO dao=new ApplyLeaveDAO();
	  int rowCount=dao.insertData(bean);
	  
	  if(rowCount>0)
	  {
		  req.setAttribute("msg","Apply Successfully");
		  req.getRequestDispatcher("apply.jsp").forward(req, res);
	  }
	  else
	  {
		  req.setAttribute("msg","Apply Failed");
		  req.getRequestDispatcher("apply.jsp").forward(req, res);
	  }
     
      }

  }

