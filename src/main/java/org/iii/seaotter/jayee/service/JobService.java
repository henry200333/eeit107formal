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
	
	public void saveApplication(SecurityUser user, Job job) {
		JobApplication application=new JobApplication();
		System.out.println(user.getUserId());
		System.out.println(job.getId());
		application.setUser(user);
		application.setJob(job);
		application.setApplicationTime(new Date());
		application.setStatus("申請中");
		jobApplicationDao.save(application);
	}
	
	public Boolean checkApplication(SecurityUser user , Job job) {
		if(jobApplicationDao.findByUserAndJob(user, job)!=null) {
			return true;
		}else {
			return false;
		}
	}
	
	public List<JobApplication> getByUser(SecurityUser user ){
		return jobApplicationDao.findByUser(user);
	}
	
	
	
	
}
