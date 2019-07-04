package org.iii.seaotter.jayee.dao;

import org.iii.seaotter.jayee.entity.Location;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface LocationDao extends JpaRepository<Location,Long>,JpaSpecificationExecutor<Location> {

}
