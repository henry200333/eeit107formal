package com.bennett;

public class MarvelMovieBean {
	
	private Integer movieId;
	private String movieName;
	private java.util.Date movieReleased;
	private String movieDirector;
	private int movieSequence;
	
	@Override
	public String toString() {
		return "MarvelMovieBean [movieId=" + movieId + ", movieName=" + movieName + ", movieReleased=" + movieReleased
				+ ", movieDirector=" + movieDirector + ", movieSequence=" + movieSequence + "]";
	}
	
	public Integer getMovieId() {
		return movieId;
	}
	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public java.util.Date getMovieReleased() {
		return movieReleased;
	}
	public void setMovieReleased(java.util.Date movieReleased) {
		this.movieReleased = movieReleased;
	}
	public String getMovieDirector() {
		return movieDirector;
	}
	public void setMovieDirector(String movieDirector) {
		this.movieDirector = movieDirector;
	}
	public int getMovieSequence() {
		return movieSequence;
	}
	public void setMovieSequence(int movieSequence) {
		this.movieSequence = movieSequence;
	}
	

}
