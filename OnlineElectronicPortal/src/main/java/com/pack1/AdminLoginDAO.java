package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminLoginDAO 
{
	public AdminBean check_adminLogin(String username,String password)
	{
		AdminBean a_bean=null;
		
		try
		{
			Connection con=DBConnect.connect();
			PreparedStatement pstmt=con.prepareStatement("select * from admin where uname=? and pword=?");
			pstmt.setString(1,username);
			pstmt.setString(2, password);
			
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				a_bean=new AdminBean();
				a_bean.setaName(rs.getString(1));
				a_bean.setaPwd(rs.getString(2));
				a_bean.setaFname(rs.getString(3));
				a_bean.setaLname(rs.getString(4));
				a_bean.setaAddr(rs.getString(5));
				a_bean.setaMid(rs.getString(6));
				a_bean.setaPhno(rs.getString(7));
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return a_bean;
	}
}
