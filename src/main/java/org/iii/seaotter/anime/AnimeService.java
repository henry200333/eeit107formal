package org.iii.seaotter.anime;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AnimeService {
	@Autowired
	AnimeDao animeDao;

	public Anime getOne(Integer id) {
		return animeDao.findOne(id);
	}

	public List<Anime> getAll() {
		return animeDao.findAll();
	}

	public void insert(Anime anime) {
		animeDao.insert(anime);
	}

	public void update(Anime anime) {
		animeDao.update(anime);
	}

	public void delete(Integer id) {
		animeDao.delete(id);
	}
}
