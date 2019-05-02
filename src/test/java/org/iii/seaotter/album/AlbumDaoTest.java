package org.iii.seaotter.album;

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

	@Test
	public void testFindAll() {
//		fail("Not yet implemented");
		List<Album> albumDaoList = albumDao.findAll();
		System.out.println(albumDaoList);
		
	}
	
	public void test

}
