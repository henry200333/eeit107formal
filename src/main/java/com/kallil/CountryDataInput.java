package com.kallil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.iii.seaotter.album.Album;
import org.iii.seaotter.album.AlbumDao;

public class CountryDataInput {

	public static void main(String[] args) {

		// Create Table
		try (Connection connection = DriverManager
				.getConnection("jdbc:sqlserver://localhost:1433;databaseName=SeaOtter", "sa", "passw0rd");) {
			String CREATE_TABLE = "create table Country (CountryId Integer primary key, CountryCode Integer, CountryName nvarchar(50), TimeBeIndependent date, State nvarchar(30))";
			PreparedStatement pstmt = connection.prepareStatement(CREATE_TABLE);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// Create Data
		Integer[] countryIdList = { 1, 2, 3, 4, 5 };
		Integer[] countryCodeList = { 1111, 2222, 3333, 4444, 5555 };
		String[] countryNameList = { "US", "China", "Taiwan", "Japan", "Korea" };
		Integer[] yearList = { 2017, 2017, 2008, 2012, 2014 };
		Integer[] monthList = { 07, 12, 05, 06, 03 };
		Integer[] dayList = { 28, 27, 27, 22, 25 };
		String[] stateList = { "AAA", "bbb", "ccc", "ddd", "eee" };

		CountryDAO countryDao = new CountryDAO();
		CountryBean cb = new CountryBean();

		for (int i = 0; i < countryIdList.length; i++) {

			cb.setCountryId(countryIdList[i]);
			cb.setCountryCode(countryCodeList[i]);
			cb.setCountryName(countryNameList[i]);
			// sql.date process
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.YEAR, yearList[i]);
			cal.set(Calendar.MONTH, monthList[i] - 1);
			cal.set(Calendar.DAY_OF_MONTH, dayList[i]);
			java.sql.Date date = new java.sql.Date(cal.getTimeInMillis());

		}
	}
}
