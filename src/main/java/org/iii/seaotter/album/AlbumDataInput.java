package org.iii.seaotter.album;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class AlbumDataInput {
	public static void main(String[] args) {
			
		//Create Table
		try(Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=SeaOtter","sa","passw0rd");) {
			String CREATE_TABLE = "create table Album (ID int primary key, Singer varchar(30), [Name] nvarchar(20), Published date, Company nvarchar(30))";
			PreparedStatement pstmt = connection.prepareStatement(CREATE_TABLE);
			pstmt.executeUpdate();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//Create Data
		int[] idList = { 1, 2, 3, 4, 5 };
		String[] singerList = { "茄子蛋", "徐佳瑩", "盧廣仲", "林宥嘉", "韋禮安" };
		String[] nameList = { "卡通人物", "心裡學", "100種生活", "大小說家", "有所畏" };
		Integer[] yearList = { 2017, 2017, 2008, 2012, 2014 };
		Integer[] monthList = { 07, 12, 05, 06, 03 };
		Integer[] dayList = { 28, 27, 27, 22, 25 };
		String[] companyList = { "艾格普蘭特艾格有限公司", "亞神音樂", "愛貝克思", "華研國際音樂", "福茂唱片" };
		
		AlbumDao albumDao = new AlbumDao();
		Album album = new Album();
		
		for (int i = 0; i < idList.length; i++) {

			album.setId(idList[i]);
			album.setSinger(singerList[i]);
			album.setName(nameList[i]);
			// sql.date process
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//			Calendar cal = Calendar.getInstance();
//			cal.set(Calendar.YEAR, yearList[i]);
//			cal.set(Calendar.MONTH, monthList[i] - 1);
//			cal.set(Calendar.DAY_OF_MONTH, dayList[i]);
//			java.sql.Date date = new java.sql.Date(cal.getTimeInMillis());
			Timestamp date = Timestamp.valueOf(LocalDateTime.of(yearList[i], monthList[i], dayList[i], 0, 0, 0));
			album.setPublished(date);
			album.setCompany(companyList[i]);
			albumDao.insert(album);
		}

	}

}
