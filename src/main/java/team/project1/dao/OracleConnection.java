
package team.project1.dao;

import java.sql.*;

public class OracleConnection {

	public static Connection getConnection () throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url="jdbc:oracle:thin:@javaking.iptime.org:1521:orcl";
		String user="test15";
		String pwd="test";
		Connection conn = DriverManager.getConnection(url,user,pwd); 
		return conn;
	}
}
