package org.iii.seaotter.artists;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.iii.seaotter.player.Player;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArtistsService {
	
	@Autowired
	private ArtistsDao artistsDao;
	
	@Autowired
	private PerformanceDao performanceDao;
	
	public Artists getOne(Integer id) throws SQLException {	
		return artistsDao.findOne(id);
	}
	
	public List<Artists> getAll() throws SQLException{
		return artistsDao.findAll();
	}
	
	public void create(Artists artists) throws SQLException {
		artistsDao.insert(artists);
	}
	
	public void update(Artists artists) throws SQLException {
		artistsDao.update(artists);
	}
	
	public void delete(Integer id) throws SQLException {
		
		Artists artists = artistsDao.findOne(id);
		String name = artists.getName();		
		//performanceDao.delete(name);  // 要額外寫個用name刪除的方法
		
		artistsDao.delete(id);
	}	

}
