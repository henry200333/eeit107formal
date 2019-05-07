package org.iii.seaotter.anime;

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
	public void test() {
//		fail("Not yet implemented");
		List<Anime> animeDaoList = animeDao.findAll();
		System.out.println(animeDaoList.size());
	}

}
