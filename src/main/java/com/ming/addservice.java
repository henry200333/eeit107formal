package com.ming;

import java.sql.Date; 
import java.sql.Timestamp;
import java.util.Collection;

public class addservice {
	
	
	void Newartists(Artists artists) {
		new ArtistsDao().insert(artists);
	}
	void Newartists(String name,Date joinDate,Integer manager) {
		Artists artists=new Artists(name, joinDate, manager);
		new ArtistsDao().insert(artists);
	}
	
	void addshow(String showName, String artist, String type, Timestamp date) {
		Performance performance=new Performance(showName, artist, type, date);
		new PerformanceDao().insert(performance);
	}
	void addshow(Performance performance) {
		new PerformanceDao().insert(performance);
	}
	
	void addshows(Collection<Performance> performances) {
		PerformanceDao dao=new PerformanceDao();
			for (Performance performance : performances){
				 dao.insert(performance);
			}			
	}
	
			
		
	}


