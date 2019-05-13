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
		Show show=new Show(showName, artist, type, date);
		new ShowDao().insert(show);
	}
	void addshow(Show show) {
		new ShowDao().insert(show);
	}
	
	void addshows(Collection<Show> shows) {
		ShowDao dao=new ShowDao();
			for (Show show : shows){
				 dao.insert(show);
			}			
	}
	
			
		
	}


