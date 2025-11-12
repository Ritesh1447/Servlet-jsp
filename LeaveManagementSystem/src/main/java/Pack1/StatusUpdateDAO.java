package Pack1;
import java.sql.Connection;
	
import java.sql.PreparedStatement;

	
	public class StatusUpdateDAO{
	    public int updateStatus(String leaveId, String newStatus) {
	        int rowCount = 0;

	        try {
	            Connection con = DBconnect.connect();  
	            PreparedStatement pstmt = con.prepareStatement("update leave set status=? where lid=?");

	            pstmt.setString(1, newStatus);
	            pstmt.setString(2, leaveId);

	            rowCount = pstmt.executeUpdate();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return rowCount;
	    }
	

}

