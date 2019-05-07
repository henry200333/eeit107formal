package org.iii.seaotter.anime;

import static org.junit.Assert.assertEquals;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.iii.seaotter.anime.Anime;
import org.iii.seaotter.anime.AnimeDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest
@RunWith(SpringRunner.class)
public class AnimeDaoTest {
	@Autowired
	private AnimeDao animeDao;
	
	@Test
	public void testProcedure() {
//		fail("Not yet implemented");
		List<Anime> animeDaoList = animeDao.findAll();
		assertEquals(5, animeDaoList.size());
		//test findAll() End
		
		Anime anime = animeDao.findOne(2);
		assertEquals("魔法少女小圓", anime.getName());
		//test findOne() End
		
		anime.setId(100);
		anime.setName("Another");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date1;
		try {
			date1 = sdf.parse("2000-01-09");
			anime.setReleaseDate(new java.sql.Date(date1.getTime()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		anime.setGenre("驚悚");
		anime.setEpisode(12);
		animeDao.insert(anime);
		animeDaoList = animeDao.findAll();
		assertEquals(6, animeDaoList.size());
		//test insert() End
		
		try {
			date1 = sdf.parse("2012-01-09");
			anime.setReleaseDate(new java.sql.Date(date1.getTime()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		animeDao.update(anime);
		anime = animeDao.findOne(100);
		assertEquals("驚悚", anime.getGenre());
		//test update() findOne() End
		
		animeDao.delete(100);
		animeDaoList = animeDao.findAll();
		assertEquals(5, animeDaoList.size());
	}

}
