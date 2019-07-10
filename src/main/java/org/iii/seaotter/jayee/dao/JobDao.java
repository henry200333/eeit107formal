package org.iii.seaotter.jayee.dao;


import java.util.List;

import org.iii.seaotter.jayee.entity.Job;
import org.iii.seaotter.jayee.entity.Vender;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface JobDao extends JpaRepository<Job, Long>,JpaSpecificationExecutor<Job> {
	public List<Job> findByVender(Vender vender);
}
