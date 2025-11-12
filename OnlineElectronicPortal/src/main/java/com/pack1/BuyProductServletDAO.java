package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BuyProductServletDAO 
{
	public ProductBean check_product(String pcode)
	{
		ProductBean pb=new ProductBean();
		try
		{
			Connection con=DBConnect.connect();
			PreparedStatement pstmt=con.prepareStatement("Select * from products where pcode=?");
			pstmt.setString(1, pcode);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
			pb=new ProductBean();
			pb.setpCode(rs.getString(1));
			pb.setpName(rs.getString(2));
			pb.setpCompany(rs.getString(3));
			pb.setpPrice(rs.getString(4));
			pb.setpQty(rs.getString(5));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return pb;
	}
}
