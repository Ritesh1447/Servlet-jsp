package Pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserLoginDAO 
{
	public UserBean checkLogin(String name,String password)
	{
		UserBean bean=null;
		
		try
		{
			Connection con=DBconnect.connect();
			PreparedStatement pstmt=con.prepareStatement("select * from users where name=? and password=?");
			
			pstmt.setString(1, name);
			pstmt.setString(2, password);
			
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				bean=new UserBean();
				bean.setId(rs.getString(1));
				bean.setName(rs.getString(2));
				bean.setPassword(rs.getString(3));
				bean.setRole(rs.getString(4));
			}
					
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
			return bean;
	}
}
