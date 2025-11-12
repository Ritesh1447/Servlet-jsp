package Pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AdminViewDAO
{
ArrayList<LeaveBean> al=new ArrayList<LeaveBean>();
	
	public ArrayList<LeaveBean> reterive()
	{
		try
		{
			Connection con=DBconnect.connect();
			PreparedStatement pstmt=con.prepareStatement("select * from leave");
			ResultSet rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				LeaveBean bean=new LeaveBean();
				bean.setLeaveId(rs.getString(1));
				bean.setUsername(rs.getString(2));
				bean.setFromdate(rs.getString(3).toString());
				bean.setTo_date(rs.getString(4).toString());
				bean.setReason(rs.getString(5));
				bean.setStatus(rs.getString(6));
				
				al.add(bean);
			}
		}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		
		return al;
	}
}
