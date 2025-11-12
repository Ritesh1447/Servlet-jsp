package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserLoginDAO 
{
	public UserBean checkLogin(String username,String password)
	{
		UserBean bean=null;
		try
		{
			Connection con=DBConnect.connect();
			PreparedStatement pstmt=con.prepareStatement("select * from registration where username=? and password=?");
			pstmt.setString(1,username);
			pstmt.setString(2,password);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				bean=new UserBean();
				bean.setUser_name(rs.getString(1));
				bean.setUser_password(rs.getString(2));
				bean.setUser_fname(rs.getString(3));
				bean.setUser_lname(rs.getString(4));
				bean.setUser_mail(rs.getString(5));
				bean.setUser_phone(rs.getString(6));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return bean;
	}
}