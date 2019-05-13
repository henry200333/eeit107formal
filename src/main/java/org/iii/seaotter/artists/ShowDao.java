package org.iii.seaotter.artists;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;

public class ShowDao {
	
	@Autowired 
	private DataSource dataSource;

	public void insert(Artists artists) {
	}
	
	public void update(Artists artists) {
	}
	
	public void delete(Integer id) {
	}
	
	public Artists findOne(Integer id) {
		return new Artists();
	}
	
	public List<Artists> findAll(){
		List<Artists> artistsList = new ArrayList<Artists>();
		return artistsList;
	}
}
