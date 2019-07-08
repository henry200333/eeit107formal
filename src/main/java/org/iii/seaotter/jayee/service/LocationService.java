package org.iii.seaotter.jayee.service;

import java.util.List;
import java.util.Optional;

import org.iii.seaotter.jayee.dao.LocationDao;
import org.iii.seaotter.jayee.entity.Location;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LocationService {
	@Autowired
	private LocationDao locationDao;
	
	public List<Location> getAll(){
		return locationDao.findAll();
	}
	public Object getById(Long id){
		return locationDao.findById(id);
	}
	
	public List<String> getDistinctCity(){	
		return locationDao.findDistinctCity();	
	}
	public List<Location> getByCity(String city){	
		return locationDao.findByCityIs(city);	
	}
	
	public List<String> getDistinctDistrictByCity(String city){
		return locationDao.findDistinctDistrictByCity(city);
	}
	
	public List<Location> getByDistrict(String district){	
		return locationDao.findByDistrictIs(district);	
	}
	public List<Location> getByLocationName(String locationName){
		return locationDao.findByLocationNameIs(locationName);	
	}
	
	
}
