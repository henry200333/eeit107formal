package org.iii.seaotter.album;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class AlbumTest {

	public static void main(String[] args) {
		
		
		AlbumDao albumDao = dataSource.AlbumDao();
		
		/*Insert Test
		Album album = new Album();
		album.setId(6);
		album.setSinger("張學友");
		album.setName("吻別");
		//sql.date process
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, 1993);
		cal.set(Calendar.MONTH, 3 - 1);
		cal.set(Calendar.DAY_OF_MONTH, 5);
		java.sql.Date date = new java.sql.Date(cal.getTimeInMillis());
		
		album.setPublished(date);
		album.setCompany("寶麗金");
		albumDao.insert(album);
		*/
		
		/*Update Test
		Album album = new Album();
		album.setId(1);
		album.setSinger("張三豐");
		album.setName("吻別");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, 1993);
		cal.set(Calendar.MONTH, 3 - 1);
		cal.set(Calendar.DAY_OF_MONTH, 5);
		java.sql.Date date = new java.sql.Date(cal.getTimeInMillis());
		
		album.setPublished(date);
		album.setCompany("寶麗金");
		albumDao.update(album);
		*/
		/*
		albumDao.delete(2);
		*/
		/*FindOne Test
		System.out.println(albumDao.findOne(1).toString());
		*/
		
		
		/*FindAll Test
		System.out.println(albumDao.findAll());
		*/
		
	}

}
