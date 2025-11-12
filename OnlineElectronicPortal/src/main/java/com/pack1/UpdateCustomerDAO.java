package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UpdateCustomerDAO 
{
	 public static boolean Updatequantity(String pcode, int reqqty)
	 {
			int rowCount=0;
			try
			{
				Connection con=DBConnect.connect();
				PreparedStatement pstmt=con.prepareStatement("select pqty from products where pcode=?");
			
				
				pstmt.setString(1, pcode);;
				ResultSet rs=pstmt.executeQuery();
				
				  if (rs.next()) {
		                int currentQty = rs.getInt("pqty");

		                if (currentQty >= reqqty) {
		          int newQty = currentQty - reqqty;
		          
		          PreparedStatement pstmt2=con.prepareStatement("update products set pqty=? where pcode=?");
		          pstmt2.setInt(1, newQty);
		          pstmt2.setString(2, pcode);
		          
		          rowCount=pstmt2.executeUpdate();
		          return rowCount>0;
		                }
				  }
		                
			}
				  
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return false;
		}
	 
	 }

