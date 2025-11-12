package Pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ApplyLeaveDAO 
{
	int insertData(LeaveBean lb)
	{
		int rowCount=0;
		try
		{
			Connection con=DBconnect.connect();
			PreparedStatement pstmt=con.prepareStatement("insert into leave values(?,?,?,?,?,?)");
			
			pstmt.setString(1,lb.getLeaveId());
			pstmt.setString(2,lb.getUsername());
			pstmt.setDate(3, java.sql.Date.valueOf(lb.getFromdate())); // assuming startDate is in yyyy-MM-dd
			pstmt.setDate(4, java.sql.Date.valueOf(lb.getTo_date()));   // same here
			pstmt.setString(5,lb.getReason());
			pstmt.setString(6, "Pending"); // set default status manually
			
			rowCount=pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		return rowCount;
	}
}
