package com.jasonpeng;

import java.sql.*;
import java.text.*;

public class Proedure1 {

	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		PreparedStatement pstmt3 = null;

		try {
			String connurl = "jdbc:sqlserver://localhost:1433;databaseName=Movie";
			conn = DriverManager.getConnection(connurl, "sa", "passw0rd");

			String instStmt = "INSERT INTO playlist VALUES ('2016-12-25 13:00', 1, 'AÆU' )";
			pstmt = conn.prepareStatement(instStmt);
			int n = pstmt.executeUpdate();
			System.out.println("update num = " + n);

			String qryStmt = "SELECT * FROM m_room WHERE roomid = ?";
			pstmt2 = conn.prepareStatement(qryStmt);
			pstmt2.setString(1, "AÆU");
			rs = pstmt2.executeQuery();
			while (rs.next()) {
				System.out.print("roomid = " + rs.getString("roomid") + ", ");
				System.out.print("seat_row = " + rs.getInt("seat_row") + ", ");
				System.out.println("seat_col = " + rs.getInt("seat_col"));
			}

			for (int i = 1; i <= 25; i++) {
				for (int j = 1; j <= 20; j++) {
					String instStmt2 = "INSERT INTO seats VALUES ('2016-12-25 13:00', 1, ?, 0, NULL)";
					pstmt3 = conn.prepareStatement(instStmt2);
					Format f1 = new DecimalFormat("00");
					pstmt3.setString(1, f1.format(i) + "-" + f1.format(j));
					pstmt3.executeUpdate();
					System.out.println("2016-12-25 13:00 1 " + f1.format(i) + "-" + f1.format(j) + " 0 NULL");
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt3.close();
				rs.close();
				pstmt2.close();
				pstmt.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}

	}

}
