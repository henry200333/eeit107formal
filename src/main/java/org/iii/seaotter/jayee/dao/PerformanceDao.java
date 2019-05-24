package org.iii.seaotter.jayee.dao;

import org.iii.seaotter.jayee.entity.Artist;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PerformanceDao extends JpaRepository<Artist,Long>{

}
