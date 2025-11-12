package Pack1;

import java.sql.Connection;
import java.sql.DriverManager;

	public class DBconnect 
	{
	public static Connection con=null;
		
		private DBconnect()
		{
			
		}
		static
		{
			try
			{
				Class.forName("oracle.jdbc.OracleDriver");
			con	=DriverManager.getConnection(DBinfo.DBurl,DBinfo.DBUname,DBinfo.DBpwd);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
			public static Connection connect()
			{
				return con;
			}
	}

