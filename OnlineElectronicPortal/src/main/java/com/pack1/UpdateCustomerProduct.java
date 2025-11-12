package com.pack1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updatec")
public class UpdateCustomerProduct extends HttpServlet
{
	protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		 String pcode = req.getParameter("ppcode");
	        int reqqty = Integer.parseInt(req.getParameter("reqqty"));
	        int price = Integer.parseInt(req.getParameter("pprice"));
	        
	        int total = reqqty * price;

	        // Call DAO to update quantity
	        boolean success = UpdateCustomerDAO.Updatequantity(pcode, reqqty);

	        if (success) {
	            // Set total amount and product code to show on confirmation page
	            req.setAttribute("total", total);
	            req.setAttribute("productCode", pcode);

	            // Forward to order confirmation JSP
	            req.getRequestDispatcher("OrderConfirmed.jsp").forward(req, res);
	        } 
	        else {
	            req.setAttribute("msg","Purchase Failed");
	            req.getRequestDispatcher("OrderConfirmed.jsp").forward(req, res);
	        }
	}
}
