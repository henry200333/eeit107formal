package com.bennett;

import java.util.List;

public interface MarvelMovieDAO {

	MarvelMovieBean findByPrimaryKey(Integer movieId);

	List<MarvelMovieBean> findAll();

	MarvelMovieBean update(String movieName, java.util.Date movieReleased, String movieDirector, int movieSequence);

	MarvelMovieBean create(MarvelMovieBean bean);

	boolean remove(Integer movieId);

}
