package com.jasonpeng;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class PlayerDataInput {
	public static void main(String[] args) throws SQLException {

		PlayerDAO dao = new PlayerDAO();
		Player player = new Player();

		// Create Table
		String CREATE_TABLE = "create table Player(playerId int primary key,playerName varchar(20),playerBDate date,playerTel varchar(10),playerYears int)";
		Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=SeaOtter", "sa",
				"passw0rd");
		PreparedStatement pstmt = conn.prepareStatement(CREATE_TABLE);
		pstmt.executeUpdate();

		// Create Data
		Integer[] idList = { 1, 2, 3, 4, 5 };
		String[] nameList = { "Jason", "Leo", "Henry", "Kali", "Bird" };
		Integer[] yearList = { 1994, 1992, 1989, 1995, 2000 };
		Integer[] monthList = { 04, 12, 05, 07, 01 };
		Integer[] dayList = { 01, 13, 20, 29, 01 };
		String[] telList = { "0912345678", "0912345678", "0912345678", "0912345678", "0912345678" };
		Integer[] yearsList = { 3, 0, 6, 7, 8 };

		for (int i = 0; i < idList.length; i++) {

			player.setPlayerId(idList[i]);
			player.setPlayerName(nameList[i]);

			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.YEAR, yearList[i]);
			cal.set(Calendar.MONTH, monthList[i] - 1);
			cal.set(Calendar.DAY_OF_MONTH, dayList[i]);
			java.sql.Date date = new java.sql.Date(cal.getTimeInMillis());

			player.setPlayerBDate(date);
			player.setPlayerTel(telList[i]);
			player.setPlayerYears(yearsList[i]);
			
			dao.create(player);
		}
	}
}
