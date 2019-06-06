package org.iii.seaotter.jayee.service;

import java.util.List;

import org.iii.seaotter.jayee.dao.VenderDao;
import org.iii.seaotter.jayee.entity.Forum;
import org.iii.seaotter.jayee.entity.Vender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VenderService {
	@Autowired
	private VenderDao venderDao;
	
	public List<Vender> getAll() {
		return venderDao.findAll();
		
	}
	
	public Vender create(Vender vender) {	
		return venderDao.save(vender);
	}
	
	public void delete(long id) {	
		  venderDao.deleteById(id);
		  return ;
	}
}
