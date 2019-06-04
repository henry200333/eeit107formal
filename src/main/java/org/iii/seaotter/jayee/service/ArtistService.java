package org.iii.seaotter.jayee.service;

import java.util.List;

import org.iii.seaotter.jayee.dao.ArtistDao;
import org.iii.seaotter.jayee.entity.Artist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ArtistService {
	@Autowired
	private ArtistDao artistDao;

	@Transactional(readOnly = true)
	public List<Artist> getAll() {
		return artistDao.findAll();
	}

	public Artist getById(Long id) {
		return artistDao.findById(id).orElse(null);
	}

	public Artist insert(Artist entity) {
		return artistDao.save(entity);
	}

	public Artist update(Artist entity) {
		Artist artist = null;
		if (artistDao.findById(entity.getId()) != null) {
			artist = artistDao.save(entity);
		}
		return artist;
	}

	public void delete(Artist entity) {
		if (artistDao.findById(entity.getId()) != null) {
			artistDao.delete(entity);
		}
	}

}
