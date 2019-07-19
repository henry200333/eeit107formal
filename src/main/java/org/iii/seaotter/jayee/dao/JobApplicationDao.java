package org.iii.seaotter.jayee.dao;


import java.util.List;

import org.iii.seaotter.jayee.entity.Artist;
import org.iii.seaotter.jayee.entity.Job;
import org.iii.seaotter.jayee.entity.JobApplication;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface JobApplicationDao extends JpaRepository<JobApplication, Long>,JpaSpecificationExecutor<JobApplication> {
	public List<JobApplication> findByUserAndStatus(SecurityUser user,String status);
	public List<JobApplication> findByJobAndStatus(Job job,String status);
	public JobApplication findByUserAndJob(SecurityUser user,Job job);
}
