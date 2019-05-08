package org.iii.seaotter.album;

import static org.junit.Assert.assertEquals;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest
@RunWith(SpringRunner.class)
public class AlbumDaoTest {
	@Autowired
	private AlbumDao albumDao;
	
	int size;
	Album album = new Album();
	
	@Test
	public void testFindAll() {
//		fail("Not yet implemented");
		List<Album> albumDaoList = albumDao.findAll();
		assertEquals(5,albumDaoList.size());
		size = albumDaoList.size();
	}
	
	@Test
	public void testInsert() {		
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
		assertEquals(album,albumDao.findOne(6));
		
		albumDao.delete(6);
		ass
	}
	
		

	
	



}
