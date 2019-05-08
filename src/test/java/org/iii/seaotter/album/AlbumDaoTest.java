package org.iii.seaotter.album;

import static org.junit.Assert.assertEquals;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
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

//	@Test
//	public void testFindAll() {
//		fail("Not yet implemented");
//		List<Album> albumDaoList = albumDao.findAll();
//		assertEquals(5,albumDaoList.size());
//		size = albumDaoList.size();
//	}

	@Test
	public void testAll() {
		List<Album> albumDaoList = albumDao.findAll();
		assertEquals(5, albumDaoList.size());
		size = albumDaoList.size();

		album.setId(6);
		album.setSinger("張學友");
		album.setName("吻別");
		// sql.date process
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		Calendar cal = Calendar.getInstance();
//		cal.set(Calendar.YEAR, 1993);
//		cal.set(Calendar.MONTH, 3 - 1);
//		cal.set(Calendar.DAY_OF_MONTH, 5);
//		java.sql.Date date = new java.sql.Date(cal.getTimeInMillis());
		Timestamp date = Timestamp.valueOf(LocalDateTime.of(1993, 3, 5, 0, 0, 0));

		album.setPublished(date);
		album.setCompany("寶麗金");
		albumDao.insert(album);
		Album album2 = albumDao.findOne(6);
		assertEquals(album.getId(), album2.getId());
		assertEquals(album.getSinger(), album2.getSinger());
		assertEquals(album.getName(), album2.getName());
		assertEquals(album.getPublished(), album2.getPublished());
		assertEquals(album.getCompany(), album2.getCompany());

		album.setSinger("張清芳");
		albumDao.update(album);
		Album album3 = albumDao.findOne(6);
		assertEquals(album.getId(), album3.getId());
		assertEquals(album.getSinger(), album3.getSinger());
		assertEquals(album.getName(), album3.getName());
		assertEquals(album.getPublished(), album3.getPublished());
		assertEquals(album.getCompany(), album3.getCompany());

		albumDao.delete(6);
		List<Album> albumDaoList2 = albumDao.findAll();
		assertEquals(size, albumDaoList2.size());

	}

}
