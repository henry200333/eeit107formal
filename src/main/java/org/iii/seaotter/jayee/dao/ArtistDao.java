package org.iii.seaotter.jayee.dao;

import java.util.List;

import org.iii.seaotter.jayee.entity.Artist;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ArtistDao extends JpaRepository<Artist,Long>, JpaSpecificationExecutor<Artist>{
	
	public List<Artist> findTop5ByOrderByTotalFollowers();

}
