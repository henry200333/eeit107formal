package com.bennett;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MarvelMovieDAOJdbc implements MarvelMovieDAO {
	private static final String URL = "jdbc:sqlserver://localhost:1433;database=java";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "passw0rd";
	private static final String SELECT_BY_PK = "select * from MarvelMovie where movieId=?";
	Connection conn = null;
	
	public void getConnection() throws SQLException {
		String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=java";
		conn = DriverManager.getConnection(connUrl, "sa", "passw0rd");
	}

	public void closeConn() throws SQLException {
		if (conn != null)
			conn.close();
	}
	
	@Override
	public MarvelMovieBean findByPrimaryKey(Integer movieId) {
		MarvelMovieBean result = null;
		
		return result;
	}
	
	private static final String SELECT_ALL = "select * from MarvelMovie";
	@Override
	public List<MarvelMovieBean> findAll() {
		MarvelMovieBean bR = null;
		List<MarvelMovieBean> bRs = new ArrayList<MarvelMovieBean>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SELECT_ALL);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bR = new MarvelMovieBean();
				bR.setMovieId(rs.getInt("MovieId"));
				bR.setMovieName(rs.getString("MovieName"));
				bR.setMovieReleased(rs.getDate("MovieReleased"));
				bR.setMovieDirector(rs.getString("MovieDirector"));
				bR.setMovieSequence(rs.getInt("MovieSequence"));
				bRs.add(bR);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bRs;
	}
	
	private static final String UPDATE =
			"update MarvelMovie set movieName=?, movieReleased=?, movieDirector=?, movieSequence=?";
	@Override
	public MarvelMovieBean update(String movieName, java.util.Date movieReleased, String movieDirector, int movieSequence) {
		MarvelMovieBean result = null;
		
		return result;
	}
	
	private static final String INSERT =
			"insert into MarvelMovie (movieId, movieName, movieReleased, movieDirector, movieSequence) values (?, ?, ?, ?, ?)";
	@Override
	public MarvelMovieBean create(MarvelMovieBean bean) {
		MarvelMovieBean result = null;
		try {
			BufferedReader brdFile = 
					new BufferedReader(new FileReader("C:\\Users\\Bennett\\Desktop\\marvel_movie.csv"));
			String strLine = null;
			while ((strLine = brdFile.readLine()) != null) {
				String[] array = strLine.split(",");
				System.out.println(strLine);
				for (int i = 0; i < array.length; i++) {
					System.out.println(array[i]);
				}
				PreparedStatement pstmt = conn.prepareStatement(INSERT);
				pstmt.setInt(1, Integer.valueOf(array[0]));
				pstmt.setString(2, array[1]);
				pstmt.setDate(3, Date.valueOf(array[2]));
				pstmt.setString(4, array[3]);
				pstmt.setInt(5, Integer.valueOf(array[3]));
			
				pstmt.execute();
			}
			brdFile.close();
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	private static final String DELETE = "delete from MarvelMovie where movieId=?";
	@Override
	public boolean remove(Integer movieId) {
		
		return false;
	}
}