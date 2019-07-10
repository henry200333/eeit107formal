package org.iii.seaotter.jayee.service;





import java.util.List;

import org.iii.seaotter.jayee.dao.JobDao;
import org.iii.seaotter.jayee.entity.Job;
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
}