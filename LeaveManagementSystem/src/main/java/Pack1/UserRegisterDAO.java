package Pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserRegisterDAO 
{
	int insertData(UserBean ub)
	{
	int rowCount=0;
		try
		{
			Connection con=DBconnect.connect();
			PreparedStatement pstmt=con.prepareStatement("insert into users  values(?,?,?,?)");
			
			pstmt.setString(1,ub.getId());
			pstmt.setString(2,ub.getName());
			pstmt.setString(3,ub.getPassword());
			pstmt.setString(4,ub.getRole());
			
			rowCount=pstmt.executeUpdate();
			}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rowCount;
	}
}
