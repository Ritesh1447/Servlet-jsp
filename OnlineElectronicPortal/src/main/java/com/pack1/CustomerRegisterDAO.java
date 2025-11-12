package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class CustomerRegisterDAO 
{
	public int insertData(CustomerBean cb)
	{
		int rowCount=0;
		try
		{
			Connection con=DBConnect.connect();
			PreparedStatement pstmt=con.prepareStatement("insert into customer values(?,?,?,?,?,?,?)");
			pstmt.setString(1,cb.getUsername());
			pstmt.setString(2,cb.getPassword());
			pstmt.setString(3,cb.getFname());
			pstmt.setString(4,cb.getLname());
			pstmt.setString(5,cb.getAddress());
			pstmt.setString(6,cb.getMid());
			pstmt.setString(7,cb.getMobno());
			
			rowCount=pstmt.executeUpdate();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rowCount;
	}
}
