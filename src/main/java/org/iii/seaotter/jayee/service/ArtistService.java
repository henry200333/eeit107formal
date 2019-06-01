package org.iii.seaotter.jayee.service;

import java.util.List;

import org.iii.seaotter.jayee.dao.ArtistDao;
import org.iii.seaotter.jayee.entity.Artist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArtistService {
	@Autowired
	private ArtistDao artistDao;

	public List<Artist> getAll() {
		return artistDao.findAll();
	}

	public Artist insert() {
		Artist entity = new Artist();
		Artist artist = artistDao.save(entity);
		return artist;
	}
	
	public void delete() {
		
	}
	
	
}
