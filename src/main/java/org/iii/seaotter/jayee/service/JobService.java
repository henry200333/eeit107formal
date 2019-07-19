package org.iii.seaotter.jayee.service;





import java.util.Date;
import java.util.List;

import org.iii.seaotter.jayee.dao.JobApplicationDao;
import org.iii.seaotter.jayee.dao.JobDao;
import org.iii.seaotter.jayee.entity.Artist;
import org.iii.seaotter.jayee.entity.Job;
import org.iii.seaotter.jayee.entity.JobApplication;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.entity.Vender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class JobService {
	@Autowired
	private JobDao jobDao;
	@Autowired
	private JobApplicationDao jobApplicationDao;
	
	@Transactional(readOnly = true)
	public Page<Job> getAll(Specification<Job> specification, Pageable pageable) {
		return jobDao.findAll(specification, pageable);
		
	}
	
	
	public List<Job> getAll(){
		return jobDao.findAll();
	}
	
	public Job create(Job job) {	
		return jobDao.save(job);

	}
	
	public void delete(long id) {	
		  jobDao.deleteById(id);
		  return ;
	}
	public Job edit(Job job) {	
		return jobDao.save(job);
	}
	
	public Job getById(long id) {
		return jobDao.getOne(id);
	};
	
	public List<Job> getByVender(Vender vender){
		return jobDao.findByVender(vender);
	}
	
	public void setjobarist(Job job,SecurityUser user) {
		job.setUser(user);
		jobDao.save(job);
	}
	
	public void saveApplication(JobApplication application,String status) {
		application.setApplicationTime(new Date());
		application.setStatus(status);
		jobApplicationDao.save(application);
	}
	
	
	public JobApplication getApplication(SecurityUser user , Job job) {
		
		return jobApplicationDao.findByUserAndJob(user, job);
	}
	
	public List<JobApplication> getByUser(SecurityUser user ){
		String status="申請中";
		return jobApplicationDao.findByUserAndStatus(user, status);
	}
	
	
	
	
}
