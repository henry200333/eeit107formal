package org.iii.seaotter.jayee.service;

import org.iii.seaotter.jayee.dao.VenderDao;
import org.iii.seaotter.jayee.entity.Vender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class VenderService {
	@Autowired
	private VenderDao venderDao;
	
	@Transactional(readOnly = true)
	public Page<Vender> getAll(Specification<Vender> specification, Pageable pageable) {
		return venderDao.findAll(specification, pageable);
		
	}
	
	public Vender create(Vender vender) {	
		return venderDao.save(vender);
	}
	
	public void delete(long id) {	
		  venderDao.deleteById(id);
		  return ;
	}
	public Vender edit(Vender vender) {	
		return venderDao.save(vender);
	}
	
	public Vender getById(long id) {
		return venderDao.getOne(id);
	};
}
