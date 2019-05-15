package org.iii.seaotter.artist;

import java.sql.SQLException;
import java.util.List;

import org.iii.seaotter.performance.PerformanceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArtistService {

	@Autowired
	private ArtistDao artistsDao;

	@Autowired
	private PerformanceDao performanceDao;

	public Artist login(String username) {
		if (username != null && username.length() != 0) {
			Artist artist = artistsDao.findByName(username);
			if (artist != null) {
				return artist;
			}
		}
		return null;
	}

	public Artist getOne(Integer id) throws SQLException {
		return artistsDao.findOne(id);
	}

	public List<Artist> getAll() throws SQLException {
		return artistsDao.findAll();
	}

	public void create(Artist artists) throws SQLException {
		artistsDao.insert(artists);
	}

	public void update(Artist artists) throws SQLException {
		artistsDao.update(artists);
	}

	public void delete(Integer id) throws SQLException {

		Artist artists = artistsDao.findOne(id);
		String name = artists.getName();
		// performanceDao.delete(name); // 要額外寫個用name刪除的方法

		artistsDao.delete(id);
	}

}
