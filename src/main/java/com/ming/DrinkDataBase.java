package com.ming;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DrinkDataBase {
	private static final String URL = "jdbc:sqlserver://localhost:1433;database=seaotter";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "passw0rd";
	private static final String DataBase = "create table drink( id bigint primary key,prodname varchar(50),effdate date,capacity int,venname varchar(50))";

	void database() {  
		Connection con = null;
		PreparedStatement pstm = null;
		try {
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstm = con.prepareStatement(DataBase);
			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
