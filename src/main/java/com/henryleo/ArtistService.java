package com.henryleo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArtistService {
	@Autowired
	ArtistsDao artistsDao;	
	@Autowired
	PerformanceDao performanceDao;
	
	public Artists getOne(Integer id) {
		return artistsDao.findOne(id);
	}
	
	public List<Artists> getAll(){
		return artistsDao.findAll();
	}
	public void insert(Artists artists) {
		artistsDao.insert(artists);
	}
	
	public void delete(Integer id) {
		artistsDao.delete(id);
	}
	
	public void update(Artists artists) {
		artistsDao.update(artists);
	}
	
	public void inputVideos(Artists artists, List<Performance> performanceList) {
		for(Performance performance:performanceList) {
			performance.setaId(artists.getId());
			performanceDao.insert(performance);			
		}
		
	}
	


}
