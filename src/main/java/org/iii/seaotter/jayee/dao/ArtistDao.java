package org.iii.seaotter.jayee.dao;

import java.util.List;
import org.iii.seaotter.jayee.entity.Artist;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ArtistDao extends JpaRepository<Artist,Long>{
	
	public List<Artist> findTop5ByOrderByFanNumberDesc();
}
