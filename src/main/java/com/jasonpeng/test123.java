package com.jasonpeng;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class test123 {

	public static void main(String[] args) throws SQLException {
		
		PlayerDAO dao = new PlayerDAO();
		Player player = new Player();
		
		
		player.setPlayerId(1);
		player.setPlayerName("Jason");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, 1993);
		cal.set(Calendar.MONTH, 3 - 1);
		cal.set(Calendar.DAY_OF_MONTH, 5);
		java.sql.Date date = new java.sql.Date(cal.getTimeInMillis());
		player.setPlayerBDate(date);
		player.setPlayerTel("0912345678");
		player.setPlayerYears(5);
		dao.create(player);
		
	}

}
