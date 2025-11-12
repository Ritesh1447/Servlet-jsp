package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CustomerLoginDAO 
{
	public CustomerBean check_Login(String username,String password)
	{
		CustomerBean bean=null;
		try
		{
			Connection con=DBConnect.connect();
			PreparedStatement pstmt=con.prepareStatement("select * from customer where uname=? and pword=?");
			pstmt.setString(1,username);
			pstmt.setString(2,password);
			
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				bean=new CustomerBean();
				bean.setUsername(rs.getString(1));
				bean.setPassword(rs.getString(2));
				bean.setFname(rs.getString(3));
				bean.setLname(rs.getString(4));
				bean.setAddress(rs.getString(5));
				bean.setMid(rs.getString(6));
				bean.setMobno(rs.getString(7));
				}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return bean;
	}
}
